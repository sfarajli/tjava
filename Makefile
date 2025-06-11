all: 

install:
	mvn dependency:copy-dependencies

directory:
	mkdir -p target/classes
	mkdir -p target/test-classes

compile: directory
	javac -d target/classes -cp "target/dependency/*" src/main/java/com/dromozoa/utf8/Application.java

test: compile
	javac -d target/test-classes -cp "target/classes:target/dependency/*" src/test/java/com/dromozoa/utf8/ApplicationTest.java


clean:
	rm -rf target/classes
	rm -rf target/test-classes

depclean: 
	rm -rf target
