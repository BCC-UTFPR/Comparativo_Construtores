	.file	"mvt_for_simd.c"
	.globl	threads
	.data
	.align 4
	.type	threads, @object
	.size	threads, 4
threads:
	.long	1
	.text
	.type	init_array, @function
init_array:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	%r9, -64(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L5:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sd	-4(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sd	-20(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sd	-4(%rbp), %xmm0
	movsd	.LC0(%rip), %xmm1
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sd	-20(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sd	-4(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm1
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sd	-20(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sd	-4(%rbp), %xmm0
	movsd	.LC2(%rip), %xmm1
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sd	-20(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	movl	$0, -8(%rbp)
	jmp	.L3
.L4:
	movl	-4(%rbp), %eax
	cltq
	imulq	$32000, %rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rax, %rdx
	pxor	%xmm1, %xmm1
	cvtsi2sd	-4(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sd	-8(%rbp), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	.LC3(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movl	-8(%rbp), %eax
	cltq
	movsd	%xmm0, (%rdx,%rax,8)
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L4
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L5
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	init_array, .-init_array
	.section	.rodata
.LC4:
	.string	"%0.2lf "
	.text
	.type	print_array, @function
print_array:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L7
.L9:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	movq	%rdx, -48(%rbp)
	movsd	-48(%rbp), %xmm0
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	movq	%rdx, -48(%rbp)
	movsd	-48(%rbp), %xmm0
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	movl	-4(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	testl	%edx, %edx
	jne	.L8
	movq	stderr(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
.L8:
	addl	$1, -4(%rbp)
.L7:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L9
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	print_array, .-print_array
	.type	kernel_mvt, @function
kernel_mvt:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movl	%edi, -100(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdx, -120(%rbp)
	movq	%rcx, -128(%rbp)
	movq	%r8, -136(%rbp)
	movq	%r9, -144(%rbp)
	movl	threads(%rip), %edx
	movq	-144(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-128(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, -88(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -96(%rbp)
	movl	-100(%rbp), %eax
	movl	%eax, -56(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -52(%rbp)
	leaq	-96(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rsi
	leaq	kernel_mvt._omp_fn.0(%rip), %rdi
	call	GOMP_parallel@PLT
	movl	-52(%rbp), %eax
	movl	%eax, -4(%rbp)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	kernel_mvt, .-kernel_mvt
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	cmpl	$1, -52(%rbp)
	jle	.L12
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -4(%rbp)
	cmpl	$1, -4(%rbp)
	jle	.L12
	movl	-4(%rbp), %eax
	movl	%eax, threads(%rip)
.L12:
	movl	$4000, -8(%rbp)
	movl	$8, %esi
	movl	$16000000, %edi
	call	polybench_alloc_data@PLT
	movq	%rax, -16(%rbp)
	movl	$8, %esi
	movl	$4000, %edi
	call	polybench_alloc_data@PLT
	movq	%rax, -24(%rbp)
	movl	$8, %esi
	movl	$4000, %edi
	call	polybench_alloc_data@PLT
	movq	%rax, -32(%rbp)
	movl	$8, %esi
	movl	$4000, %edi
	call	polybench_alloc_data@PLT
	movq	%rax, -40(%rbp)
	movl	$8, %esi
	movl	$4000, %edi
	call	polybench_alloc_data@PLT
	movq	%rax, -48(%rbp)
	movq	-16(%rbp), %r8
	movq	-48(%rbp), %rdi
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movl	-8(%rbp), %eax
	movq	%r8, %r9
	movq	%rdi, %r8
	movl	%eax, %edi
	call	init_array
	movq	-16(%rbp), %r8
	movq	-48(%rbp), %rdi
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movl	-8(%rbp), %eax
	movq	%r8, %r9
	movq	%rdi, %r8
	movl	%eax, %edi
	call	kernel_mvt
	cmpl	$42, -52(%rbp)
	jle	.L13
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L13
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movl	-8(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	print_array
.L13:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.type	kernel_mvt._omp_fn.0, @function
kernel_mvt._omp_fn.0:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	addq	$-128, %rsp
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	movq	%rdi, -152(%rbp)
	movq	-152(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -64(%rbp)
	movq	-152(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -72(%rbp)
	movq	-152(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -80(%rbp)
	movq	-152(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -88(%rbp)
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -96(%rbp)
	movq	-152(%rbp), %rax
	movl	40(%rax), %eax
	movl	%eax, -100(%rbp)
	movl	-100(%rbp), %edx
	movl	-100(%rbp), %eax
	movl	$0, %r14d
	testl	%edx, %edx
	jg	.L16
	jmp	.L17
.L37:
	leaq	-128(%rbp), %rdx
	leaq	-136(%rbp), %rax
	movq	%rdx, %r9
	movq	%rax, %r8
	movl	$128, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movl	$0, %edi
	call	GOMP_loop_guided_start@PLT
	testb	%al, %al
	jne	.L18
.L35:
	cmpq	%rbx, %r14
	je	.L19
.L31:
	call	GOMP_loop_end@PLT
	movl	-100(%rbp), %edx
	movl	-100(%rbp), %eax
	movl	$0, %r12d
	testl	%edx, %edx
	jg	.L20
	jmp	.L21
.L30:
	leaq	-112(%rbp), %rdx
	leaq	-120(%rbp), %rax
	movq	%rdx, %r9
	movq	%rax, %r8
	movl	$128, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movl	$0, %edi
	call	GOMP_loop_guided_start@PLT
	testb	%al, %al
	jne	.L22
.L28:
	cmpq	%rbx, %r12
	je	.L23
.L24:
	call	GOMP_loop_end_nowait@PLT
	jmp	.L38
.L23:
	movq	-152(%rbp), %rax
	movl	-36(%rbp), %edx
	movl	%edx, 44(%rax)
	jmp	.L24
.L22:
	movq	-120(%rbp), %rax
	movl	%eax, %ecx
	movq	-112(%rbp), %rax
	movl	%eax, %r10d
	movl	%r10d, %r12d
	movl	%r13d, %r8d
	movl	-100(%rbp), %r9d
	movl	%ecx, %edi
	movl	%edi, %eax
	movl	$0, %edx
	divl	%r8d
	movl	%edx, %eax
	movl	%eax, %esi
	movl	%edi, %eax
	movl	$0, %edx
	divl	%r8d
	movl	%eax, %edx
.L26:
	cmpl	%r10d, %ecx
	jnb	.L25
	movl	%edx, -40(%rbp)
	movl	%esi, -44(%rbp)
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdi
	movq	-88(%rbp), %rax
	addq	%rax, %rdi
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %r8
	movq	-88(%rbp), %rax
	addq	%r8, %rax
	movsd	(%rax), %xmm1
	movl	-44(%rbp), %eax
	cltq
	imulq	$32000, %rax, %r8
	movq	-64(%rbp), %rax
	addq	%rax, %r8
	movl	-40(%rbp), %eax
	cltq
	movsd	(%r8,%rax,8), %xmm2
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %r8
	movq	-72(%rbp), %rax
	addq	%r8, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdi)
	addl	$1, %ecx
	leal	1(%rsi), %eax
	cmpl	%r9d, %eax
	setge	%sil
	movzbl	%sil, %esi
	addl	%esi, %edx
	movl	$0, %esi
	cmpl	%r9d, %eax
	cmovge	%esi, %eax
	movl	%eax, %esi
	jmp	.L26
.L25:
	movl	%ebx, %eax
	cmpl	%eax, %ecx
	je	.L27
.L29:
	leaq	-112(%rbp), %rdx
	leaq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	GOMP_loop_guided_next@PLT
	testb	%al, %al
	jne	.L22
	jmp	.L28
.L27:
	addl	$1, -44(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, -104(%rbp)
	addl	$1, -40(%rbp)
	movl	-40(%rbp), %eax
	movl	%eax, -36(%rbp)
	jmp	.L29
.L21:
	movl	$0, %ebx
	jmp	.L30
.L20:
	movslq	%edx, %rdx
	testl	%eax, %eax
	jle	.L21
	movslq	%eax, %r13
	movq	%rdx, %rbx
	imulq	%r13, %rbx
	jmp	.L30
.L19:
	movq	-152(%rbp), %rax
	movl	-48(%rbp), %edx
	movl	%edx, 44(%rax)
	jmp	.L31
.L18:
	movq	-136(%rbp), %rax
	movl	%eax, %ecx
	movq	-128(%rbp), %rax
	movl	%eax, %r10d
	movl	%r10d, %r14d
	movl	%r12d, %r8d
	movl	-100(%rbp), %r9d
	movl	%ecx, %edi
	movl	%edi, %eax
	movl	$0, %edx
	divl	%r8d
	movl	%edx, %eax
	movl	%eax, %esi
	movl	%edi, %eax
	movl	$0, %edx
	divl	%r8d
	movl	%eax, %edx
.L33:
	cmpl	%r10d, %ecx
	jnb	.L32
	movl	%edx, -52(%rbp)
	movl	%esi, -56(%rbp)
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdi
	movq	-96(%rbp), %rax
	addq	%rax, %rdi
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %r8
	movq	-96(%rbp), %rax
	addq	%r8, %rax
	movsd	(%rax), %xmm1
	movl	-52(%rbp), %eax
	cltq
	imulq	$32000, %rax, %r8
	movq	-64(%rbp), %rax
	addq	%rax, %r8
	movl	-56(%rbp), %eax
	cltq
	movsd	(%r8,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %r8
	movq	-80(%rbp), %rax
	addq	%r8, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdi)
	addl	$1, %ecx
	leal	1(%rsi), %eax
	cmpl	%r9d, %eax
	setge	%sil
	movzbl	%sil, %esi
	addl	%esi, %edx
	movl	$0, %esi
	cmpl	%r9d, %eax
	cmovge	%esi, %eax
	movl	%eax, %esi
	jmp	.L33
.L32:
	movl	%ebx, %eax
	cmpl	%eax, %ecx
	je	.L34
.L36:
	leaq	-128(%rbp), %rdx
	leaq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	GOMP_loop_guided_next@PLT
	testb	%al, %al
	jne	.L18
	jmp	.L35
.L34:
	addl	$1, -56(%rbp)
	movl	-56(%rbp), %eax
	movl	%eax, -104(%rbp)
	addl	$1, -52(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, -48(%rbp)
	jmp	.L36
.L17:
	movl	$0, %ebx
	jmp	.L37
.L16:
	movslq	%edx, %rdx
	testl	%eax, %eax
	jle	.L17
	movslq	%eax, %r12
	movq	%rdx, %rbx
	imulq	%r12, %rbx
	jmp	.L37
.L38:
	subq	$-128, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	kernel_mvt._omp_fn.0, .-kernel_mvt._omp_fn.0
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC1:
	.long	0
	.long	1074266112
	.align 8
.LC2:
	.long	0
	.long	1074790400
	.align 8
.LC3:
	.long	0
	.long	1085227008
	.ident	"GCC: (Debian 6.3.0-18) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
