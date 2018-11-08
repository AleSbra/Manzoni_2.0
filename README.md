# Manzoni_2.0

##Prototipo manzoniano per la visualizzazione degli scartafacci

Progetto che ha lo scopo di valorizzare le fasi compositive e narrative di alcuni manoscritti manzoniani. I file sono codificati in XML-TEI e le trasformazioni in XSL. Per creare l'applicazione web bisognoa trasformare il file codifica_tei_024a_025d utilizzando i due file XSLT. 

Per **xsl_manzoni.xsl** le trasformazioni vanno applicate quattro volte cambiando il parametro <xsl:param name="mode"> con i seguenti valori:

1. reading_fl

2. reading_sp

3. writing_fl

4. writing_sp

Per **xsl_pulito.xsl** le trasformazioni vanno applicate due volte cambiando il parametro <xsl:param name="fl-sp"> con i seguenti valori:

1. fl

2. sp
