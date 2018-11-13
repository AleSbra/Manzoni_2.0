#Manzoni_2.0

Il progetto **Dal *Fermo e Lucia* agli *Sposi promessi*: saggio per una filologia degli scartafacci** parte dall’analisi dei facsimili degli autografi del Manzoni, conservati presso la biblioteca Braidense, e dalla loro edizione critica ed ha lo scopo di valorizzare le fasi compositive e narrative.

La realizzazione è stata possibile grazie ad una sola codifica XML-TEI (**codifica_tei_024a_025d.xml**) utilizzando il marcatore &lt;sourceDoc> che permette di marcare la pagina come una &lt;surface> invece della classica divisione della pagina in &lt;div>. Questa scelta permette una successiva individuazione, all’interno della stessa pagina, di zone di testo (utilizzando il tag &lt;zone>) che risulta più adatta ai nostri scopi e più conveniente anche per andare ad individuare il testo dei cartigli che vengono spesso utilizzati dall’autore nel procedere del processo creativo.

A questo file XML-TEI sono stati applicati due file XSLT che permettono l’uno una visualizzazione in SVG delle immagini facsimile degli autografi manzoniani (**xsl_manzoni.xsl**), l’altro la visualizzazione del testo riportato sulle pagine, ma in pulito (**xsl_pulito.xslt**).

Per **xsl_manzoni.xsl** le trasformazioni vanno applicare quattro volte andando a modificare il parametro *&lt;xsl:param name=”mode”>* con i seguenti valori:

1.	reading_sp

2.	reading_fl

3.	writing_sp

4.	writing_fl

Per **xsl_pulito.xsl** vanno applicate due volte modificando il parametro *&lt;xsl:param name=”fl-sp”>* con i seguenti valori:

1.	fl

2.	sp

Applicate queste trasformazioni si otterranno: 

1.	una cartella **output**, come indicato in *&lt;xsl:result-document href=”../output/{$mode}/{$op}- {$mode}.svg”>*, contenente quattro sottocartelle denominate come i valori delle trasformazioni di xsl_manzoni.xsl contenenti ognuna i file, in formato SVG, delle pagine e dei cartigli nominati con il valore dell’attributo @n assegnato ad ogni <surface>.
    
2.	una cartella **testi**, come indicato in *&lt;xsl:result-document href=”../testi/{$fl-sp}/{@n}.html”>*, contenente due sottocartelle denominate come i valori delle trasformazioni di xsl_pulito.xsl, ognuna contente i file, in formato html, delle pagine denominate sempre con l’attributo @n di goni surface.

Tutti questi risultati sono stati inseriti all’interno di un pagine HTML (**index.html**, **ordine_compositivo.html**, **ordine_narrativo.html**, **lettura_sp.html**, **lettura_fl.html**, **cartiglio_1.html** e **cartiglio_2.html**) nelle quali è stato integrato un codice Javascript, corredato di librerie jQuery, che permette l’interattività dell’interno ambiente.
