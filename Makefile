RUST_ATCODER:=1.42.0
RUST_CODEFORCES:=1.58.0
RUST_YUKICODER:=1.53.0
RUST_LIBRARY_CHECKER:=1.53.0
RUST_AIZU_ONLINE_JUDGE:=1.41.0
RUST_ALGO_METHOD:=1.42.0

test-%:
	env RUST_BACKTRACE=1 cargo run --bin task_$* < src/$*/in

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

reset:
	echo "" > sample/a.txt
	echo "" > sample/b.txt
	echo "" > sample/c.txt
	echo "" > sample/d.txt
	echo "" > sample/e.txt
	echo "" > sample/f.txt
	echo "" > sample/g.txt
	echo "" > sample/h.txt
	echo "" > src/a.rs
	echo "" > src/b.rs
	echo "" > src/c.rs
	echo "" > src/d.rs
	echo "" > src/e.rs
	echo "" > src/f.rs
	echo "" > src/g.rs
	echo "" > src/h.rs

%: test-% build-%
	time -f "Memory:%M KB time:%e" ./target/release/task_$* < src/$*/in 1>/dev/null
