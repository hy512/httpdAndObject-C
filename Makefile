
objs = main.o request.o format.o


index.cgi : $(objs)
	gcc  `gnustep-config --objc-flags` -lgnustep-base -lstdc++ -lobjc $(objs) -o index.cgi
main.o : main.mm ./lib/request.h
	gcc -c `gnustep-config --objc-flags` -lgnustep-base -lstdc++ -lobjc main.mm
request.o : ./lib/request.h ./lib/request.mm ./lib/format.h
	gcc -c `gnustep-config --objc-flags` -lgnustep-base -lstdc++ -lobjc ./lib/request.mm
format.o : ./lib/format.h ./lib/format.m
	gcc -c `gnustep-config --objc-flags` -lgnustep-base -lobjc ./lib/format.m
.PHONY: clean
clean: 
	rm -f $(objs) *cgi httpd/*_log *.d