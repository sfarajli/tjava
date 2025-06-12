all: 

dependency:
	mvn dependency:copy-dependencies

standalone-jar:
	mkdir -p target/standalone
	cd target/standalone; curl -LO  https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/1.9.3/junit-platform-console-standalone-1.9.3.jar

directory:
	mkdir -p target/classes
	mkdir -p target/test-classes

compile: directory
	javac -d target/classes -cp "target/dependency/*" src/main/java/com/dromozoa/utf8/Application.java

test: compile
	javac -d target/test-classes -cp "target/classes:target/dependency/*" src/test/java/com/dromozoa/utf8/ApplicationTest.java

run-test: 
	# Run tests
	java -jar target/standalone/junit-platform-console-standalone-1.9.3.jar \
		--class-path target/classes:target/test-classes:target/dependency/icu4j-76.1.jar \
		--select-class com.dromozoa.utf8.ApplicationTest


clean:
	rm -rf target/classes
	rm -rf target/test-classes

depclean: 
	rm -rf target
