#Codifica XSLT

##File *xsl_manzoni.xsl*

il primo file di trasformazione ad essere codificato è **xsl_manzoni.xsl** poichè permetterà di creare i file di output in svg, indispensabili per la visualizzazione e l'animazione delle zone di testo codificate all'interno del XML-TEI *codifica_tei_024a_025d.xml*. 

Il file è composto da due elementi fondamentali:

1. il parametro  &lt;xsl:param name="mode" select="'#'"/> che determinerà su quali parti dovrà essere eseguita la trasformazione, affidando dei valori (*reading_fl*, *writing_fl*, *reading_sp* e *writing_sp*) all'attributo @select.

2. i tempalte grazie ai quali si può dare uno stile di formattazione ai diversi elementi.

Saranno questi utlimi ad interessarci particolarmente, essendo il paramentro un elemento vuoto anche se indispensabile.

Il primo *&lt;xsl:template>* è quello più lungo e corposo, in quanto svolge la maggior parte delle visualizzazioni:

1. inizia con &lt;metadata> nel quale sono conenute sia le infomazione su quali &lt;change> andare a selezionare dalle &lt;changeList>, sia dove selezionare le informazioni per la metadatane in DublinCore;

2. segue la selezione dell'immagine eseguita dall'elemento vuoto  &lt;image> e dai suoi attributi @url, @width e @height;

3. il  &lt;xsl:for-each select="tei:surface//tei:zone">, identificata da una variabile &lt;xsl:variable name="ma_g">, esegue la ricerca sui @change delle zone al variare del parametro iniziale e sarà la correttezza di questa sezione a pemettere l'esatta selezione delle zone una volta inseriti i file .svg risultanti dalla trasformazione, nel Javascript dell'ambiente web.

4. l'importanza dell'inserimento di una variabile nel passaggio precedente la si nota ora poichè quella stessa variabile *ma_g* deve essere richiamata prima di passare ad applicare per ogni zona, a seconda del tipo, uno stile diverso: gli stili non cmabiano al variare della forma della &lt;zone>, restano gli stessi che essa sia un poligono o un rettangolo;

5. l'ultimo passaggio consiste nell'affidare uno stile al testo contenuto nei &lt;line>.

A questo primo macro template, seguono altri che si occupano nell'ordine di:

- definire uno stile di visualizzazione per i &lt;del> che nel nostro caso differiscono per la presenza o l'assenza di un @type, anche nel caso un cui sia contenuto in un &lt;add>;

- affidare uno stile agli &lt;add> al differire dell'attributo @place: vengono quindi creati diversi tempalte nel caso in cui il valore dell'attributo sia *above*, *margin*, *below* o *superimposed*;

- creare una visualizzazione, coerente con le norme dei file svg, per i &lt;delSpan> nel caso in cui l'attributo @rend abbia come valore *cross*, *multiple crosses* o *horizontal line*.

##File *xsl_pulito.xsl*

Questo secondo file xslt risulta più corto e meno complesso del precedente e, quindi, di più facile comprensione e descrizione. Va premesso che i file risultanti da questa seconda trasformazione saranno degli html, nettamente più adatti allo scopo di visualizzazione in pulito del testo.

Anche qeusto file inizia con un parametro &lt;xsl:param name="fl-sp">&lt;/xsl:param>, al cui interno andranno specificati i valori sp o fl, e di vari &lt;xsl:template> organizzati come segue:

1. il primo è un tamplate che matcha su //tei:sourceDoc/tei:surfaceGrp/tei:surface[@n] ed applica il successivo &lt;xsl:template name="contenuto"> al variare del parametro;

2. segue il  &lt;xsl:template name="contenuto"> che contiene l'impaginazione html del contenuto dei &lt;zone> selezionati se nel @change contengono un #rsp o #rfl;

3. il terzo è quello relativo al &lt;milestone> che lo designa come punto di partenza di un paragrafo e contemporaneamente come la fine del precedente;

4. l'ultimo è un template vuoto utile ad evitare la visualizzazione del contenuto del &lt;teiHeader>.