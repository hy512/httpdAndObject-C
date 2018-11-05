
objs = main.o


index.cgi : $(objs)
	gcc  `gnustep-config --objc-flags` -lgnustep-base -lstdc++ -lobjc -L/usr/local/lib -lfcgi -lfcgi++ $(objs) -o index.cgi
main.o : main.mm
	gcc -c `gnustep-config --objc-flags` -lgnustep-base -lstdc++ -lobjc main.mm

.PHONY: clean
clean: 
	rm $(objs) index.cgi index.fcgi