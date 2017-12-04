	.file	"mvt_taskloop_simd.c"
	.globl	threads
	.data
	.align 4
	.type	threads, @object
	.size	threads, 4
threads:
	.long	1
	.globl	tasks
	.align 4
	.type	tasks, @object
	.size	tasks, 4
tasks:
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
	subq	$272, %rsp
	movl	%edi, -228(%rbp)
	movq	%rsi, -240(%rbp)
	movq	%rdx, -248(%rbp)
	movq	%rcx, -256(%rbp)
	movq	%r8, -264(%rbp)
	movq	%r9, -272(%rbp)
	movl	threads(%rip), %edx
	movq	-272(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-264(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-256(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-248(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-240(%rbp), %rax
	movq	%rax, -64(%rbp)
	movl	-228(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -20(%rbp)
	leaq	-64(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rsi
	leaq	kernel_mvt._omp_fn.0(%rip), %rdi
	call	GOMP_parallel@PLT
	movl	-20(%rbp), %eax
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
	movl	-4(%rbp), %eax
	movl	%eax, threads(%rip)
	movl	threads(%rip), %eax
	cmpl	$1, %eax
	jle	.L12
	movl	threads(%rip), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, tasks(%rip)
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
	pushq	%r12
	pushq	%rbx
	subq	$240, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -248(%rbp)
	movq	-248(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-248(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-248(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-248(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	-248(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	-248(%rbp), %rax
	movl	40(%rax), %eax
	movl	%eax, -60(%rbp)
	call	GOMP_single_start@PLT
	cmpb	$1, %al
	je	.L16
.L24:
	call	GOMP_barrier@PLT
	call	GOMP_single_start@PLT
	cmpb	$1, %al
	je	.L17
.L20:
	call	GOMP_barrier@PLT
	jmp	.L26
.L17:
	movl	-60(%rbp), %edx
	movl	-60(%rbp), %eax
	movl	tasks(%rip), %esi
	testl	%edx, %edx
	jg	.L18
	jmp	.L19
.L21:
	movl	$0, %edi
	movq	%rcx, %r8
	movq	%r12, -160(%rbp)
	movq	%rcx, -168(%rbp)
	movl	%eax, -148(%rbp)
	movl	%edx, -152(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -192(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -200(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -208(%rbp)
	movq	-248(%rbp), %rax
	addq	$44, %rax
	movq	%rax, -184(%rbp)
	leaq	-228(%rbp), %rax
	movq	%rax, -176(%rbp)
	movslq	%esi, %rdx
	leaq	-224(%rbp), %rax
	subq	$8, %rsp
	pushq	$1
	pushq	%r8
	pushq	%rdi
	pushq	$0
	pushq	%rdx
	movl	$1280, %r9d
	movl	$8, %r8d
	movl	$80, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	leaq	kernel_mvt._omp_fn.2(%rip), %rdi
	call	GOMP_taskloop@PLT
	addq	$48, %rsp
	jmp	.L20
.L19:
	movl	$0, %ecx
	jmp	.L21
.L18:
	movslq	%edx, %rcx
	testl	%eax, %eax
	jle	.L19
	movslq	%eax, %r12
	imulq	%r12, %rcx
	jmp	.L21
.L16:
	movl	-60(%rbp), %edx
	movl	-60(%rbp), %eax
	movl	tasks(%rip), %esi
	testl	%edx, %edx
	jg	.L22
	jmp	.L23
.L25:
	movl	$0, %edi
	movq	%rcx, %r8
	movq	%rbx, -80(%rbp)
	movq	%rcx, -88(%rbp)
	movl	%eax, -68(%rbp)
	movl	%edx, -72(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -112(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -120(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -128(%rbp)
	movq	-248(%rbp), %rax
	addq	$44, %rax
	movq	%rax, -104(%rbp)
	leaq	-228(%rbp), %rax
	movq	%rax, -96(%rbp)
	movslq	%esi, %rdx
	leaq	-144(%rbp), %rax
	subq	$8, %rsp
	pushq	$1
	pushq	%r8
	pushq	%rdi
	pushq	$0
	pushq	%rdx
	movl	$1280, %r9d
	movl	$8, %r8d
	movl	$80, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	leaq	kernel_mvt._omp_fn.1(%rip), %rdi
	call	GOMP_taskloop@PLT
	addq	$48, %rsp
	jmp	.L24
.L23:
	movl	$0, %ecx
	jmp	.L25
.L22:
	movslq	%edx, %rcx
	testl	%eax, %eax
	jle	.L23
	movslq	%eax, %rbx
	imulq	%rbx, %rcx
	jmp	.L25
.L26:
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	kernel_mvt._omp_fn.0, .-kernel_mvt._omp_fn.0
	.type	kernel_mvt._omp_fn.1, @function
kernel_mvt._omp_fn.1:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movq	%rdi, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	(%rax), %rcx
	movq	-64(%rbp), %rax
	movq	8(%rax), %rsi
	movq	-64(%rbp), %rax
	movq	64(%rax), %rdx
	movq	-64(%rbp), %rax
	movq	56(%rax), %r9
	movq	-64(%rbp), %rax
	movl	76(%rax), %r10d
	movq	-64(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-64(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -48(%rbp)
	movl	%esi, %r11d
	movl	%r11d, %ebx
	movl	%edx, %r8d
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
.L29:
	cmpl	%r11d, %ecx
	jnb	.L28
	movl	%edx, -12(%rbp)
	movl	%esi, -16(%rbp)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdi
	movq	-48(%rbp), %rax
	addq	%rax, %rdi
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %r8
	movq	-48(%rbp), %rax
	addq	%r8, %rax
	movsd	(%rax), %xmm1
	movl	-12(%rbp), %eax
	cltq
	imulq	$32000, %rax, %r8
	movq	-32(%rbp), %rax
	addq	%rax, %r8
	movl	-16(%rbp), %eax
	cltq
	movsd	(%r8,%rax,8), %xmm2
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %r8
	movq	-40(%rbp), %rax
	addq	%r8, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdi)
	addl	$1, %ecx
	leal	1(%rsi), %eax
	cmpl	%r10d, %eax
	setge	%sil
	movzbl	%sil, %esi
	addl	%esi, %edx
	movl	$0, %esi
	cmpl	%r10d, %eax
	cmovge	%esi, %eax
	movl	%eax, %esi
	jmp	.L29
.L28:
	movl	%r9d, %eax
	cmpl	%eax, %ecx
	je	.L30
.L33:
	cmpq	%r9, %rbx
	jne	.L27
	movq	-64(%rbp), %rax
	movq	48(%rax), %rax
	movl	-20(%rbp), %edx
	movl	%edx, (%rax)
	movq	-64(%rbp), %rax
	movq	40(%rax), %rax
	movl	-24(%rbp), %edx
	movl	%edx, (%rax)
	jmp	.L27
.L30:
	addl	$1, -16(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -20(%rbp)
	addl	$1, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -24(%rbp)
	jmp	.L33
.L27:
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	kernel_mvt._omp_fn.1, .-kernel_mvt._omp_fn.1
	.type	kernel_mvt._omp_fn.2, @function
kernel_mvt._omp_fn.2:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movq	%rdi, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	(%rax), %rcx
	movq	-64(%rbp), %rax
	movq	8(%rax), %rsi
	movq	-64(%rbp), %rax
	movq	64(%rax), %rdx
	movq	-64(%rbp), %rax
	movq	56(%rax), %r9
	movq	-64(%rbp), %rax
	movl	76(%rax), %r10d
	movq	-64(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-64(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -48(%rbp)
	movl	%esi, %r11d
	movl	%r11d, %ebx
	movl	%edx, %r8d
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
.L36:
	cmpl	%r11d, %ecx
	jnb	.L35
	movl	%edx, -12(%rbp)
	movl	%esi, -16(%rbp)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdi
	movq	-48(%rbp), %rax
	addq	%rax, %rdi
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %r8
	movq	-48(%rbp), %rax
	addq	%r8, %rax
	movsd	(%rax), %xmm1
	movl	-16(%rbp), %eax
	cltq
	imulq	$32000, %rax, %r8
	movq	-32(%rbp), %rax
	addq	%rax, %r8
	movl	-12(%rbp), %eax
	cltq
	movsd	(%r8,%rax,8), %xmm2
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %r8
	movq	-40(%rbp), %rax
	addq	%r8, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdi)
	addl	$1, %ecx
	leal	1(%rsi), %eax
	cmpl	%r10d, %eax
	setge	%sil
	movzbl	%sil, %esi
	addl	%esi, %edx
	movl	$0, %esi
	cmpl	%r10d, %eax
	cmovge	%esi, %eax
	movl	%eax, %esi
	jmp	.L36
.L35:
	movl	%r9d, %eax
	cmpl	%eax, %ecx
	je	.L37
.L40:
	cmpq	%r9, %rbx
	jne	.L34
	movq	-64(%rbp), %rax
	movq	48(%rax), %rax
	movl	-20(%rbp), %edx
	movl	%edx, (%rax)
	movq	-64(%rbp), %rax
	movq	40(%rax), %rax
	movl	-24(%rbp), %edx
	movl	%edx, (%rax)
	jmp	.L34
.L37:
	addl	$1, -16(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -20(%rbp)
	addl	$1, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -24(%rbp)
	jmp	.L40
.L34:
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	kernel_mvt._omp_fn.2, .-kernel_mvt._omp_fn.2
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
