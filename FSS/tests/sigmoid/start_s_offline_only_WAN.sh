for ((i=0; i<1000; i++)) do

    echo $i > offline_results/index.txt
    echo "Processing iteration $i"

    fssc --bitlen 64 main.ezpc
    sudo ip netns exec ns1 ./main.out r=1 file=1

done
