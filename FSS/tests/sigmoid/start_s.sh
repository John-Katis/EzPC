fssc --bitlen 32 main.ezpc
./main.out r=1 file=1
# cat input2.txt | ./main.out r=2 file=1 port=42004 nt=4 & #nohup before calling file
# cat input2.txt | ./main.out r=3 file=1 server=127.0.0.1 port=42004 nt=4 > "results/numeric_results/result1.txt";

for ((i=0; i<1000; i++)) do

    echo $i > results/index.txt
    echo "Processing iteration $i"

    # cat $input_file |
    cat input1.txt | ./main.out r=2 file=1 port=42004 nt=1 &
    cat input1.txt | ./main.out r=3 file=1 server=127.0.0.1 port=42004 nt=1 > "results/numeric_results/result${i}.txt";
    sleep 0.5 # this waits until the server is done - otherwise we go into the new iteration and index goes +1, losing 1 set of results (1/1000)

done
