fssc --bitlen 64 main.ezpc
./main.out r=1 file=1
cat input1.txt | ./main.out r=2 file=1 port=42004 nt=4 & #nohup before calling file
cat input1.txt | ./main.out r=3 file=1 server=127.0.0.1 port=42004 nt=4 # | client.txt

#TODO do the rest