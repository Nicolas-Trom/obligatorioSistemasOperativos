#include <pthread.h>
#include <semaphore.h>
#include <stdlib.h>
#include <stdio.h>

sem_t sem1,sem2,sem3,sem4,sem5,sem6,sem7,sem8,sem9,sem10,sem11,sem12,sem13,sem14,sem15,sem16,sem17,sem18;
void* a(void * x){
	printf("A\n");
}

void* b(void * x){
	printf("B\n");
	sem_post(&sem1);
}
void* c(void * x){
	printf("C\n");
	sem_post(&sem2);
}
void* h(void * x){
	printf("H\n");
	sem_post(&sem3);
}
void* d(void * x){
	printf("D\n");
	sem_post(&sem4);
}
void* e(void * x){
	printf("E\n");
	sem_post(&sem5);
    sem_post(&sem6);
}
void* f(void * x){
	sem_wait(&sem4);
	sem_wait(&sem5);
	printf("F\n");
	sem_post(&sem7);
}
void* g(void * x){
	sem_wait(&sem6);
	sem_wait(&sem3);
	printf("G\n");
	sem_post(&sem8);
}

void* q(void * x){
	sem_wait(&sem7);
	sem_wait(&sem8);
	printf("Q\n");
	sem_post(&sem9);
	sem_post(&sem10);
	sem_post(&sem11);
}

void* i(void * x){
	sem_wait(&sem9);
	printf("I\n");
	sem_post(&sem12);
	sem_post(&sem13);
}
void* j(void * x){
	sem_wait(&sem10);
	printf("J\n");
	sem_post(&sem14);
}
void* k(void * x){
	sem_wait(&sem11);
	printf("K\n");
}
void* l(void * x){
	sem_wait(&sem12);
	printf("L\n");
	sem_post(&sem15);
}
void* m(void * x){
	sem_wait(&sem13);
	sem_wait(&sem14);
	printf("M\n");
	sem_post(&sem16);
}

void* n(void * x){
	sem_wait(&sem15);
	printf("N\n");
	sem_post(&sem17);
}
void* p(void * x){
	sem_wait(&sem16);
	printf("P\n");
	sem_post(&sem18);
}
void* o(void * x){
	sem_wait(&sem17);
	sem_wait(&sem18);
	printf("O\n");
}


int main(){
	sem_init(&sem1,0, 0);
	sem_init(&sem2,0, 0);
	sem_init(&sem3,0, 0);
	sem_init(&sem4,0, 0);
	sem_init(&sem5,0, 0);
	sem_init(&sem6,0, 0);
	sem_init(&sem7,0, 0);
	sem_init(&sem8,0, 0);
	sem_init(&sem9,0, 0);
	sem_init(&sem10,0, 0);
	sem_init(&sem11,0, 0);
	sem_init(&sem12,0, 0);
	sem_init(&sem13,0, 0);
	sem_init(&sem14,0, 0);
	sem_init(&sem15,0, 0);
	sem_init(&sem16,0, 0);
	sem_init(&sem17,0, 0);
	sem_init(&sem18,0, 0);
	pthread_t ta, tb, tc, td, te, tf, tg, tq, th, ti, tj, tk, tl, tm, tn, to, tp;	
	pthread_attr_t attr;
	pthread_attr_init(&attr);
	pthread_create(&ta, &attr, a, NULL);
	pthread_create(&tb, &attr, b, NULL);
	pthread_create(&tc, &attr, c, NULL);
	pthread_create(&td, &attr, d, NULL);
	pthread_create(&te, &attr, e, NULL);
	pthread_create(&th, &attr, h, NULL);
	pthread_create(&tf, &attr, f, NULL);
	pthread_create(&tg, &attr, g, NULL);
	pthread_create(&tq, &attr, q, NULL);
	pthread_create(&ti, &attr, i, NULL);
	pthread_create(&tj, &attr, j, NULL);
	pthread_create(&tk, &attr, k, NULL);
	pthread_create(&tl, &attr, l, NULL);
	pthread_create(&tm, &attr, m, NULL);
	pthread_create(&tn, &attr, n, NULL);
	pthread_create(&to, &attr, o, NULL);
	pthread_create(&tp, &attr, p, NULL);

	pthread_join(ta, NULL);
	pthread_join(tb, NULL);
	pthread_join(tc, NULL);
	pthread_join(td, NULL);
	pthread_join(te, NULL);
	pthread_join(th, NULL);
	pthread_join(tf, NULL);
	pthread_join(tg, NULL);
	pthread_join(to, NULL);
	pthread_join(ti, NULL);
	pthread_join(tj, NULL);
	pthread_join(tk, NULL);
	pthread_join(tl, NULL);
	pthread_join(tm, NULL);
	pthread_join(tn, NULL);
	pthread_join(tp, NULL);

	return 0;

}




