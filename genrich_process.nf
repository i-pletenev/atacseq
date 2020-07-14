process MERGED_LIB_GENRICH {
	tag "$name"
	publishDir "${params.outdir}/bwa/mergedLibrary/genrich/narrowPeak", mode: params.publish_dir_mode
	
	when:
	params.genrich

	input:
	tuple val(name), path(bam) from ch_mlib_rm_orphan_bam_genrich	
	
	"""
	Genrich -j -t ${bam[0]}  -o ${name}.narrowPeak
	"""
}
