#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import csv
import subprocess
import numpy as np


def executar_benchmark(nome_benchmark, num_threads):
    dicionario_comandos = {
    'taskloop':'./mvt_taskloop',
    'for':'./mvt_for',
    'sequencial':'./mvt_sequencial',
    'taskloop_simd':'./mvt_taskloop_simd',
    'for_simd':'./mvt_for_simd',
    'sequencial_simd':'./mvt_sequencial_simd'
    }

    if nome_benchmark in dicionario_comandos.keys():
        if 'taskloop' == nome_benchmark:
            saidas = subprocess.check_output(
                [dicionario_comandos['taskloop'], str(num_threads)]).split('\n')
            return float(saidas[0])

        elif 'for' == nome_benchmark:
            saidas = subprocess.check_output(
                [dicionario_comandos['for'], str(num_threads)]).split('\n')
            return float(saidas[0])

        elif 'sequencial' == nome_benchmark:
            saidas = subprocess.check_output([dicionario_comandos['sequencial']]).split('\n')
            return float(saidas[0])

        elif 'taskloop_simd' == nome_benchmark:
            saidas = subprocess.check_output(
                [dicionario_comandos['taskloop_simd'], str(num_threads)]).split('\n')
            return float(saidas[0]) 

        elif 'for_simd' == nome_benchmark:
            saidas = subprocess.check_output(
                [dicionario_comandos['for_simd'], str(num_threads)]).split('\n')
            return float(saidas[0])

        elif 'sequencial_simd' == nome_benchmark:
            saidas = subprocess.check_output([dicionario_comandos['sequencial_simd']]).split('\n')
            return float(saidas[0])
    else:
        print('[Erro] Opção de benchmark não encontrada, verifique seu código!')

if __name__ == "__main__":
    if not os.path.exists('./graficos'):
        os.makedirs('./graficos')

    print('[PD360] Inicializando o código...')

    benchmark_taskloop = {}
    benchmark_for = {}
    benchmark_sequencial = {}
    benchmark_sequencial_simd = {}
    benchmark_for_simd = {}
    benchmark_taskloop_simd = {}

    tamanho_dataset = 'LARGE_DATASET'
    nome_arquivo_csv = 'resultados.csv'

    # Esta área corresponde aos códigos executados no segundo projeto
    print('[PD360] Compilando o código sequencial...')
    comando_sequencial = 'gcc -I utilities -I linear-algebra/kernels/mvt utilities/polybench.c linear-algebra/kernels/mvt/mvt.c -DPOLYBENCH_TIME -D%s -o mvt_sequencial -O0' % (
        tamanho_dataset)
    print(comando_sequencial)
    subprocess.call(comando_sequencial.split())

    print('[PD360] Compilando o código taskloop...')
    comando_taskloop = 'gcc -I utilities -I linear-algebra/kernels/mvt utilities/polybench.c -fopenmp -fdump-tree-ompexp-graph linear-algebra/kernels/mvt/mvt_taskloop.c -DPOLYBENCH_TIME -D%s -o mvt_taskloop -O0' % (
        tamanho_dataset)
    print(comando_taskloop)
    subprocess.call(comando_taskloop.split())

    print('[PD360] Compilando o código parallel for...')
    comando_for = 'gcc -I utilities -I linear-algebra/kernels/mvt utilities/polybench.c -fopenmp -fdump-tree-ompexp-graph linear-algebra/kernels/mvt/mvt_for.c -DPOLYBENCH_TIME -D%s -o mvt_for -O0' % (
        tamanho_dataset)
    print(comando_for)
    subprocess.call(comando_for.split())

    # Esta área corresponde aos códigos executados no terceiro projeto
    print('[PD360] Compilando o código sequencial + simd...')
    comando_sequencial_simd = 'gcc -I utilities -I linear-algebra/kernels/mvt utilities/polybench.c -fopenmp -fdump-tree-ompexp-graph linear-algebra/kernels/mvt/mvt_simd.c -DPOLYBENCH_TIME -D%s -o mvt_sequencial_simd -O0' % (
        tamanho_dataset)
    print(comando_sequencial_simd)
    subprocess.call(comando_sequencial_simd.split())

    print('[PD360] Compilando o código parallel for + simd...')
    comando_for_simd = 'gcc -I utilities -I linear-algebra/kernels/mvt utilities/polybench.c -fopenmp -fdump-tree-ompexp-graph linear-algebra/kernels/mvt/mvt_for_simd.c -DPOLYBENCH_TIME -D%s -o mvt_for_simd -O0' % (
        tamanho_dataset)
    print(comando_for_simd)
    subprocess.call(comando_for_simd.split())

    print('[PD360] Compilando o código taskloop + simd...')
    comando_taskloop_simd = 'gcc -I utilities -I linear-algebra/kernels/mvt utilities/polybench.c -fopenmp -fdump-tree-ompexp-graph linear-algebra/kernels/mvt/mvt_taskloop_simd.c -DPOLYBENCH_TIME -D%s -o mvt_taskloop_simd -O0' % (
        tamanho_dataset)
    print(comando_taskloop_simd)
    subprocess.call(comando_taskloop_simd.split())

    num_tentativas = 10
    num_threads_list = [2,4,8,16]

    for num_threads in num_threads_list:
        print('[PD360] Executando ' + str(num_tentativas) +
              ' tentativas com ' + str(num_threads) + ' threads...')

        benchmark_taskloop[num_threads] = []
        benchmark_for[num_threads] = []
        benchmark_sequencial[num_threads] = []
        benchmark_sequencial_simd[num_threads] = []
        benchmark_for_simd[num_threads] = []
        benchmark_taskloop_simd[num_threads] = []

        for repetir in range(0, num_tentativas):
            # Sequencial
            benchmark_sequencial[num_threads].append(
                executar_benchmark('sequencial', num_threads))
            # For
            benchmark_for[num_threads].append(
                executar_benchmark('for', num_threads))
            # Taskloop
            benchmark_taskloop[num_threads].append(
                executar_benchmark('taskloop', num_threads))
            # Sequencial + Simd
            benchmark_sequencial_simd[num_threads].append(
                executar_benchmark('sequencial_simd', num_threads))
            # For + Simd
            benchmark_for_simd[num_threads].append(
                executar_benchmark('for_simd', num_threads))
            # Taskloop + Simd
            benchmark_taskloop_simd[num_threads].append(
                executar_benchmark('taskloop_simd', num_threads))

    tentativas_colunas = ['tentativa_' + str(i) for i in range (0, num_tentativas)]
    fieldnames = ['num_threads', 'tipo'] + tentativas_colunas + ['media']

    arquivo_csv = open(nome_arquivo_csv, 'w')
    writer = csv.DictWriter(arquivo_csv, fieldnames=fieldnames)
    writer.writeheader()

    for num_threads in num_threads_list:
        csv_sequencial = {'tipo':'sequencial', 'num_threads': num_threads}
        csv_for = {'tipo':'for', 'num_threads': num_threads}
        csv_taskloop = {'tipo':'taskloop', 'num_threads': num_threads}
        csv_sequencial_simd = {'tipo':'sequencial_simd', 'num_threads': num_threads}
        csv_for_simd = {'tipo':'for_simd', 'num_threads': num_threads}
        csv_taskloop_simd = {'tipo':'taskloop_simd', 'num_threads': num_threads}

        for i in range (0, num_tentativas):
            csv_sequencial['tentativa_' + str(i)] = benchmark_sequencial[num_threads][i]
            csv_for['tentativa_' + str(i)] = benchmark_for[num_threads][i]
            csv_taskloop['tentativa_' + str(i)] = benchmark_taskloop[num_threads][i]
            csv_sequencial_simd['tentativa_' + str(i)] = benchmark_sequencial_simd[num_threads][i]
            csv_for_simd['tentativa_' + str(i)] = benchmark_for_simd[num_threads][i]
            csv_taskloop_simd['tentativa_' + str(i)] = benchmark_taskloop_simd[num_threads][i]

        print('[PD360] Calculando médias das tentativas...')
        # Média Sequencial
        media_sequencial = sum(benchmark_sequencial[num_threads]) / float(len(benchmark_sequencial[num_threads]))
        # Média For
        media_for = sum(benchmark_for[num_threads]) / float(len(benchmark_for[num_threads]))
        # Média Taskloop
        media_taskloop = sum(benchmark_taskloop[num_threads]) / float(len(benchmark_taskloop[num_threads]))
        # Média Sequencial Simd
        media_sequencial_simd = sum(benchmark_sequencial_simd[num_threads]) / float(len(benchmark_sequencial_simd[num_threads]))
        # Média For Simd
        media_for_simd = sum(benchmark_for_simd[num_threads]) / float(len(benchmark_for_simd[num_threads]))
        # Média Taskloop Simd
        media_taskloop_simd = sum(benchmark_taskloop_simd[num_threads]) / float(len(benchmark_taskloop_simd[num_threads]))

        csv_sequencial['media'] = media_sequencial
        csv_for['media'] = media_for
        csv_taskloop['media'] = media_taskloop
        csv_sequencial_simd['media'] = media_sequencial_simd
        csv_for_simd['media'] = media_for_simd
        csv_taskloop_simd['media'] = media_taskloop_simd

        print('[PD360] Escrevendo resultados em um arquivo CSV...')
        writer.writerow(csv_sequencial)
        writer.writerow(csv_for)
        writer.writerow(csv_taskloop)
        writer.writerow(csv_sequencial_simd)
        writer.writerow(csv_for_simd)
        writer.writerow(csv_taskloop_simd)
