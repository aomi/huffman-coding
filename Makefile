.phony all:
all: encode encode-o decode decode-o

encode: encode.c
	gcc encode.c -o encode

encode-o: encode_optimized.c
	gcc encode_optimized.c -o encode-o

decode: decode.c
	gcc decode.c -o decode

decode-o: decode_optimized.c
	gcc decode_optimized.c -o decode-o

.PHONY clean:
clean:
	-rm -rf *.o *.exe *.bin *.out encode decode encode-o decode-o
