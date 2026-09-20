CC = mpicc
NP = 4
PROGRAMS = sum_bcast sum_scatter sum_gather sum_reduce sum_allreduce sum_scan

all: $(PROGRAMS)

sum_bcast: sum_bcast.c
	$(CC) -o sum_bcast sum_bcast.c

sum_scatter: sum_scatter.c
	$(CC) -o sum_scatter sum_scatter.c

sum_gather: sum_gather.c
	$(CC) -o sum_gather sum_gather.c

sum_reduce: sum_reduce.c
	$(CC) -o sum_reduce sum_reduce.c

sum_allreduce: sum_allreduce.c
	$(CC) -o sum_allreduce sum_allreduce.c

sum_scan: sum_scan.c
	$(CC) -o sum_scan sum_scan.c

run: all
	@for p in $(PROGRAMS); do \
		echo "=== Running $$p with $(NP) processes ==="; \
		mpirun -np $(NP) ./$$p; \
		echo; \
	done

clean:
	rm -f $(PROGRAMS)

.PHONY: all run clean
