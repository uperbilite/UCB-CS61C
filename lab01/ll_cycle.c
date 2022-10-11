#include <stddef.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head) {
	node *tortoise = head;
	node *hare = head;
	if (head == NULL) {
		return 0;
	}
	while (hare -> next != NULL && hare -> next -> next != NULL) {
		hare = hare -> next -> next;
		tortoise = tortoise -> next;
		if (tortoise == hare) {
			return 1;
		}
	}
    return 0;
}
