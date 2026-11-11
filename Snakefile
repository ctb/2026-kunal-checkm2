MAGS=[ x.strip() for x in open('kunal-mag-list-used.txt') ]

rule all:
    input:
        expand('checkm.{mag}.d', mag=MAGS)

rule run_checkm2:
    input:
        "genomes/{mag}.fasta"
    output:
        directory("checkm.{mag}.d")
    threads: 16
    shell: """
        checkm2 predict --threads {threads} \
            --input {input} --output-directory {output} \
            --database_path checkm2-db/CheckM2_database/uniref100.KO.1.dmnd
    """
