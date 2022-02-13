#include <limits.h>
#include <stdio.h>
#include <stdlib.h>

#define INC_TOKEN	    1
#define DEC_TOKEN	    2
#define INC_VAL_TOKEN	3
#define DEC_VAL_TOKEN	4
#define OUT_TOKEN	    5
#define IN_TOKEN	    6
#define LOOP_TOKEN      7
#define GOTO_TOKEN      8
#define EOF_TOKEN       0

#define PROGRAM_SIZE  4096
#define DATA_SIZE 65535
#define STACK_SIZE 512

struct token{
    unsigned short type;
    unsigned short value;
};

struct Stack{
	unsigned int capacity;
	short top_index;
	int* array;
};

struct Stack* buildStack(unsigned int capacity){
	struct Stack* stack = (struct Stack*) malloc(sizeof(struct Stack));
	stack->capacity = capacity;
	stack->top_index = -1;
	stack->array = (int*) malloc(sizeof(int) * capacity);
	return stack; 	
}

int isFull(struct Stack* stack){
	return (stack->top_index == stack->capacity - 1);
}

int isEmpty(struct Stack* stack){
	return (stack->top_index == -1);
}

void push(struct Stack* stack, int value){
	stack->top_index++;
	stack->array[stack->top_index] = value;
}

int pop(struct Stack* stack){
	return (stack->array[stack->top_index--]);
}

struct token PROGRAM[PROGRAM_SIZE];
unsigned int SP = 0; // stack pointer

int compile(FILE* fptr, struct Stack* stack) {
	
	unsigned int prog_pos = 0;
	unsigned int jump_pos;
	
	int c;
	
	while((c = getc(fptr)) != EOF && prog_pos < PROGRAM_SIZE - 1){
			
		
	switch(c) {
		case '>': 
			PROGRAM[prog_pos].type = INC_TOKEN;
			prog_pos++;
			break;
		case '<': 
			PROGRAM[prog_pos].type = DEC_TOKEN;
			prog_pos++;
			break;
		case '+': 
			PROGRAM[prog_pos].type = INC_VAL_TOKEN;
			prog_pos++;
			break;
		case '-': 
			PROGRAM[prog_pos].type = DEC_VAL_TOKEN; 
			prog_pos++;
			break;
		case '.': 
			PROGRAM[prog_pos].type = OUT_TOKEN; 
			prog_pos++;
			break;
		case ',': 
			PROGRAM[prog_pos].type = IN_TOKEN; 
			prog_pos++;
			break;
		case '[':
			PROGRAM[prog_pos].type = LOOP_TOKEN;
			
			if (isFull(stack)){
				fprintf(stderr, "Error: stack overflow");
				return -1;
			}
			push(stack, prog_pos);
			prog_pos++;
			
			break;
		case ']':
			PROGRAM[prog_pos].type = GOTO_TOKEN;
			
			if (isEmpty(stack)){
				fprintf(stderr, "Error: found ] without matching [");
				return -1;
			}
			
			jump_pos = pop(stack);		// jmp_pos is the location of the previous [ parenthesis 	
			
			PROGRAM[prog_pos].value = jump_pos;
			PROGRAM[jump_pos].value = prog_pos;		// jump_pos of the matching [ is set to the current location
			prog_pos++;
			break;
		default:
			break;
		}	
	}
	
	if (!isEmpty(stack)) {
		fprintf(stderr, "Error: the stack is not empty after execution of the program");
        return -1;
    }
	
	if (prog_pos == PROGRAM_SIZE - 1) {
		fprintf(stderr, "Error: the program pointer has reached MAX_PROGRAM_SIZE");
	}
	
	PROGRAM[prog_pos].type = EOF_TOKEN;
	return 0;
}

int execute() {
    unsigned short data[DATA_SIZE], prog_pos = 0;
    unsigned int data_pos = DATA_SIZE;
    while (--data_pos != 0) { data[data_pos] = 0; }
    while (PROGRAM[prog_pos].type != EOF_TOKEN && data_pos < DATA_SIZE) {
        switch (PROGRAM[prog_pos].type) {
            case INC_TOKEN: data_pos++; break;
            case DEC_TOKEN: data_pos--; break;
            case INC_VAL_TOKEN: data[data_pos]++; break;
            case DEC_VAL_TOKEN: data[data_pos]--; break;
            case OUT_TOKEN: putchar(data[data_pos]); break;
            case IN_TOKEN: data[data_pos] = (unsigned short)getchar(); break;
            case LOOP_TOKEN: if(!data[data_pos]) { prog_pos = PROGRAM[prog_pos].value; } break;
            case GOTO_TOKEN: if(data[data_pos]) { prog_pos = PROGRAM[prog_pos].value; } break;
            default: return -1;
        }
		
        prog_pos++;
    }
	
	if (data_pos == DATA_SIZE){
		return -1;
	}
	
    return 0;
}


int main() {
		
	FILE *fptr;
	char* filename = "C:\\Users\\Saverio\\Desktop\\Programs\\C\\C_workspace\\bf_interpreter\\bf_program.txt";
	fptr = fopen(filename, "r");
	
	if (fptr == NULL){
		fprintf(stderr, "Error: cannot open file: %s ", filename);
	}
	
	struct Stack* stack = buildStack(STACK_SIZE);
	    
	int status = compile(fptr, stack);
    fclose(fptr);
	
	
	int program = 0;
	
	if (status == 0){
		program = execute();
	}
	
	printf("Return value %d", program);
	
    return 0;
} 
