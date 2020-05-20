latest:
	make rstan rmd ppca myenv
rstan: .PHONY
	make -C rstan/ latest
ppca: .PHONY
	make -C ppca/ latest
rmd: .PHONY
	make -C rmd/ latest
myenv: .PHONY
	make -C myenv/ latest

all:
	make -C ppca/ all
	make -C rstan/ all
	make -C rmd/ all
	make -C myenv/ all

.PHONY:
	echo "Building Rocker versioned images locally...\n"

clean::
	make -C ppca/ clean
	make -C rstan/ clean
	make -C rmd/ clean
	make -C myenv/ clean
