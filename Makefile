
objs = main.o


index.cgi : $(objs)
	gcc  `gnustep-config --objc-flags` -lgnustep-base -lstdc++ -lobjc $(objs) -o index.cgi
main.o : main.mm
	gcc -c `gnustep-config --objc-flags` -lgnustep-base -lstdc++ -lobjc main.mm

.PHONY: clean
clean: 
	rm -f $(objs) index.cgi index.fcgi httpd/*_log