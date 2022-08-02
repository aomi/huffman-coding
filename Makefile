.phony all:
all: encode encode-o decode decode-o

encode: encode.c
	gcc encode.c -o encode

disklist: encode_optimized.c
	gcc encode_optimized.c -o encode-o

diskget: decode.c
	gcc decode.c -o decode

diskput: decode_optimized.c
	gcc decode_optimized.c -o decode

.PHONY clean:
clean:
	-rm -rf *.o *.exe *.bin *.out encode decode encode-o decode-o
