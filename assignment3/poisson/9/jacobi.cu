#include <stdio.h>
__global__ void jacobi(double * uold, double * unew, double * f, int width, int height, double lambda2){
	int blockId = blockIdx.x + blockIdx.y * gridDim.x;
	int index = blockId * (blockDim.x * blockDim.y) + (threadIdx.y * blockDim.x) + threadIdx.x;

	if(index < width*height){
		int M = width+2;
		int i = index + M + 1 + 2 * (index / width);

		unew[i] = 0.25 * (uold[i-1] + uold[i+1] + uold[i-M] + uold[i+M] + lambda2*f[i]);	
	}
}