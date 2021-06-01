output=/storeData/project/user/daixiaozhuan/smallRNAseq_raw/result/NonhumanRNA
for file in `find ./*/bowtie1_tRNA_pm -name "*.count" |egrep "SRR[0-9]+.count"`
do
  awk -v OFS='\t' '
    function basename(file){
      sub(".*/", "", file)
      sub(".count", "", file)
      return file
    }
    {print $1,$3, basename(FILENAME)}' $file >>$output/merge.count
done
