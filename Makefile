
objs = main.o request.o


index.cgi : $(objs)
	gcc  `gnustep-config --objc-flags` -lgnustep-base -lstdc++ -lobjc $(objs) -o index.cgi
main.o : main.mm ./lib/request.h
	gcc -c `gnustep-config --objc-flags` -lgnustep-base -lstdc++ -lobjc main.mm
request.o : ./lib/request.h ./lib/request.mm
	gcc -c `gnustep-config --objc-flags` -lgnustep-base -lstdc++ -lobjc ./lib/request.mm

.PHONY: clean
clean: 
	rm -f $(objs) *cgi httpd/*_log *.d