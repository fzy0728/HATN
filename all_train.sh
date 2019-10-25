

domains[0]="books"
domains[1]="dvd"
domains[2]="electronics"
domains[3]="kitchen"
domains[4]="video"

for src_domain in ${domains[@]};
do
	for tar_domain in  ${domains[@]};
	do
		if [ $src_domain != $tar_domain ];
		then
			python extract_pivots.py --train --test -s $src_domain -t $tar_domain --verbose | tee -a ./work/logs/PNet.txt
			python train_hatn.py     --train --test -s $src_domain -t $tar_domain --verbose | tee -a ./work/logs/HATN.txt
		fi
	done
done


