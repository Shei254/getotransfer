CC=gcc
CXX=g++
RM=rm -f
CPPFLAGS=-g
#$(shell root-config --cflags)
# -Wall
LDFLAGS=-g
#$(shell root-config --ldflags)
LDLIBS=
#$(shell root-config --libs)

SRCS=servercore.cpp serverconnection.cpp fileoperator.cpp getotransfer.cpp
OBJS=$(subst .cpp,.o,$(SRCS))

all: getotransfer

getotransfer: $(OBJS)
	$(CXX) $(LDFLAGS) -o getotransfer $(OBJS) $(LDLIBS)

depend: .depend

.depend: $(SRCS)
	$(RM) ./.depend
	$(CXX) $(CPPFLAGS) -MM $^>>./.depend;

clean: 
	$(RM) $(OBJS) getotransfer

distclean: clean
	$(RM) *~ .depend

include .depend
