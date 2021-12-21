RUST_ATCODER:=1.42.0
RUST_CODEFORCES:=1.57.0
RUST_YUKICODER:=1.53.0
RUST_LIBRARY_CHECKER:=1.53.0
RUST_AIZU_ONLINE_JUDGE:=1.41.0
RUST_ALGO_METHOD:=1.42.0

run-%: test-% build-%
	time -f "Memory:%M KB time:%e" ./target/release/task_$* < sample/$*.txt 1>/dev/null

test-%:
	cargo run --bin task_a < sample/$*.txt

build-%:
	cat current-toolchain && cargo +`cat current-toolchain` build --bin task_$* --release

atcoder:
	echo $(RUST_ATCODER) > current-toolchain

codeforces:
	echo $(RUST_CODEFORCES) > current-toolchain

yukicoder:
	echo $(RUST_YUKICODER) > current-toolchain

library-checker:
	echo $(RUST_LIBRARY_CHECKER) > current-toolchain

aizu-online-judge:
	echo $(RUST_AIZU_ONLINE_JUDGE) > current-toolchain

algo-method:
	echo $(RUST_ALGO_METHOD) > current-toolchain
