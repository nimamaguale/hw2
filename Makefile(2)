VERILOG = iverilog
TARGET = nonblocking.vcd
TEMP = temp.vvp
$(TARGET) : $(TEMP)
	vvp $(TEMP)
$(TEMP): nonblocking_tb.v nonblocking.v
	$(VERILOG) -o $(TEMP) nonblocking_tb.v nonblocking.v
clean:
	-del $(TARGET)
	-del $(TEMP)
