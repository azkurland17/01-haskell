STACK=stack

UNAME := $(shell uname)
ifeq ($(UNAME), Linux)
  FORMAT=aout
else
ifeq ($(UNAME), Darwin)
  FORMAT=macho
endif
endif

COURSE=cs130s
ASGN=01-haskell

test: clean
	$(STACK) test 

bin:
	$(STACK) build

clean: 
	$(STACK) clean

distclean: clean 
	rm -rf .stack-work 

tags:
	hasktags -x -c lib/

turnin: 
	# rm -rf .stack-work
	rm -rf $(ASGN).tgz
	tar -zcvf ../$(ASGN).tgz --exclude .stack-work --exclude .git ../$(ASGN)
	mv ../$(ASGN).tgz . 
	turnin -c $(COURSE) ./$(ASGN).tgz

