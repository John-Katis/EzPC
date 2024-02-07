fssc --bitlen 32 main.ezpc
./main.out r=1 file=1

for ((i=0; i<1000; i++)) do

    echo $i > results/index.txt
    echo "Processing iteration $i"

    # cat $input_file |
    cat input1.txt | sudo nohup ip netns exec ns1 ./main.out r=2 file=1 port=42004 nt=1 &
    cat input1.txt | sudo nohup ip netns exec ns2 ./main.out r=3 file=1 server=192.168.1.1 port=42004 nt=1 > "results/numeric_results/result${i}.txt";
    sleep 0.5 # this waits until the server is done - otherwise we go into the new iteration and index goes +1, losing 1 set of results (1/1000)

done
