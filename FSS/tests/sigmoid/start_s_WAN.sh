fssc --bitlen 64 main.ezpc

for ((i=0; i<1; i++)) do

    echo $i > results/index.txt
    echo "Processing iteration $i"

    echo $i > offline_results/index.txt
    sudo ip netns exec ns1 ./main.out r=1 file=1 nt=1

    # cat $input_file |
    cat input1.txt | sudo nohup ip netns exec ns1 ./main.out r=2 file=1 port=42004 nt=1 &
    cat input1.txt | sudo nohup ip netns exec ns2 ./main.out r=3 file=1 server=192.168.1.1 port=42004 nt=1 > "results/numeric_results/result${i}.txt";
    sleep 1 # this waits until the server is done

done
