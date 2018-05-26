#include <stdlib.h>
#include <string.h>

typedef struct Node {
	char name[50];
	struct Node* next;
}Node;

Node* Top = NULL;

Node* AddNode(char* NodeName){
	Node* newNode = (Node*)malloc(sizeof(Node));
	strcpy(newNode->name,NodeName);
	newNode->next = Top;
	Top = newNode;
	return newNode;
}	

Node* SearchForNode(char* NodeName){
	Node* i ;
	for(i = Top;i != NULL ; i = i->next){
		if(!strcmp(i->name,NodeName))
			return i;
	}
	return NULL;
}

