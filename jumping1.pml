/*
 * Ex. 1
 */

int array[10];

inline randInit(c) {
        do
	:: c < 9 -> c++
	:: c < 9 -> c++
	:: c < 9 -> c++
	:: c < 9 -> c++
	:: c < 9 -> c++
	:: c < 9 -> c++
	:: c < 9 -> c++
	:: c < 9 -> c++
	:: c < 9 -> c++
	:: break
	od;
}

inline randAction(a) {
        do
	:: a < 2 -> a++
	:: a < 2 -> a++
	:: break
	od;
}

inline printArray() {
	int k;
	for (k in array) {
		printf("\tarray[%d] = %d\n", k, array[k])
	}
}

proctype Search(int c) {
	int i, a, n;
	do
	:: array[i] == 1 -> n++; break
	:: else -> randAction(a); printf("action %d\n", a);
		   if
		   :: a == 0 -> array[c] = 0; c = (c+1)%10; array[c] = 1; printArray()
		   :: a == 1 -> array[c] = 0; c = (c == 0 -> 9 : c-1); array[c] = 1; printArray()
		   :: a == 2 -> skip
		   fi;
		   a = 0;
		   i = (i+1)%10;
		   n++
	od
	printf("1 found at position %d after %d iterations\n", i, n); //display result
}

init {
	int c;
	randInit(c);
	array[c] = 1;
	printArray();
	run Search(c)
}


