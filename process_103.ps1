$src = 'c:\Users\cesar\OneDrive\Área de Trabalho\sitephc_br\product\103\index.html'
$dst = 'c:\Users\cesar\OneDrive\Área de Trabalho\sitephc_br\product\103\index2.html'

$content = [System.IO.File]::ReadAllText($src, [System.Text.Encoding]::UTF8)

# Fix DOCTYPE and lang
$content = $content -replace '<!DOCTYPE >', '<!DOCTYPE html>'
$content = $content -replace 'lang="en"', 'lang="pt-BR"'

# Fix stray <> after <body>
$content = $content -replace '<body><>', '<body>'

# Remove popup block: from the poppromotimer div to end of mobilefixer2 style block (before <div id="wrapper">)
$content = $content -replace '(?s)\s*<div style="position:fixed.*?id="poppromotimer".*?</div>\s*</div>\s*\r?\n\s*<script>.*?</script>\s*\r?\n\s*<style>.*?</style>\s*\r?\n', "`n"

# Remove MSO/Word comments
$content = $content -replace '(?s)<!--\[if gte mso.*?\[endif\]-->', ''

# Fix corrupted characters
$content = $content -replace [char]0xFFFD, ''
$content = $content -replace '\?$', ''

# Fix title
$content = $content -replace '<title>Pharmacom Labs - View Product</title>', '<title>Pharmacom Labs - Ver Produto</title>'

# Navigation
$content = $content -replace '>About Us<', '>Sobre Nós<'
$content = $content -replace '>News<', '>Notícias<'
$content = $content -replace '>INNOVATIONS<', '>INOVAÇÕES<'
$content = $content -replace '>Innovations<', '>Inovações<'
$content = $content -replace '>Products<', '>Produtos<'
$content = $content -replace '>Check code<', '>Verificar código<'
$content = $content -replace '>Dealers<', '>Revendedores<'
$content = $content -replace '>Analysis<', '>Análises<'
$content = $content -replace '>Contact<', '>Contato<'

# Sidebar categories
$content = $content -replace '<h4>Premium Line</h4>', '<h4>Linha Premium</h4>'
$content = $content -replace '<h4>Basic Line</h4>', '<h4>Linha Básica</h4>'
$content = $content -replace '>Orals<', '>Orais<'
$content = $content -replace '>HGH and Peptides<', '>HGH e Peptídeos<'
$content = $content -replace '>Injectables<', '>Injetáveis<'
$content = $content -replace '>Post-cycle therapy \(PCT\)<', '>Terapia Pós-Ciclo (TPC)<'
$content = $content -replace '>Fat loss<', '>Perda de Gordura<'
$content = $content -replace '>Testosterones<', '>Testosteronas<'
$content = $content -replace '>Nandrolones<', '>Nandrolonas<'
$content = $content -replace '>Boldenones<', '>Boldenonas<'
$content = $content -replace '>Trenbolones<', '>Trenbolonas<'
$content = $content -replace '>Primobolan<', '>Primobolanas<'
$content = $content -replace '>Masterones<', '>Masteronas<'
$content = $content -replace '>Mixes Special Line<', '>Mixes Linha Especial<'

# Breadcrumb
$content = $content -replace 'Products // Post-cycle therapy \(PCT\) // Clomos', 'Produtos // Terapia Pós-Ciclo (TPC) // Clomos'

# Replace product description section with clean translated HTML
$oldDesc = '(?s)<div class="item-info">.*?</div>\s*\r?\n\s*<h3 class="a">'
$newDesc = @'
<div class="item-info">
<p>Clomos (princípio ativo: citrato de clomifeno) é um modulador seletivo dos receptores de estrogênio (SERM) não esteroidal do grupo trifeniletileno. O clomifeno foi desenvolvido e aprovado no início dos anos 1970 para o tratamento da infertilidade feminina, sendo posteriormente ampliado para o tratamento da infertilidade masculina também.</p>
<p>Na grande maioria dos casos, este SERM é utilizado para fins de Terapia Pós-Ciclo (TPC), com o objetivo de estimular a produção natural de testosterona que foi suprimida pelo uso de esteroides anabolizantes. O clomifeno estimula o hipotálamo, que por sua vez estimula a glândula pituitária anterior a liberar hormônios gonadotrópicos. Os hormônios gonadotrópicos são o hormônio folículo-estimulante (FSH) e o hormônio luteinizante (LH). O FSH estimula (em homens) a espermatogênese e o LH estimula as células de Leydig dos testículos a secretar mais testosterona. Esse mecanismo de retroalimentação é conhecido como eixo hipotalâmico-hipofisário-testicular (HHTA) e resulta em um aumento da produção endógena de testosterona. Os níveis sanguíneos aumentam para compensar os níveis decrescentes de esteroides exógenos. Isso é fundamental para minimizar as perdas musculares pós-ciclo.</p>
<p>O clomifeno, assim como todos os compostos trifeniletileno da família SERM (tamoxifeno, clomifeno e toremifeno), também apresenta efeitos agonistas estrogênicos. O clomifeno, sendo um SERM, não reduz os níveis circulantes de estradiol no sangue, mas atua ocupando os sítios receptores para que o estrogênio em si não possa se ligar a esses receptores, devido à maior afinidade de ligação do clomifeno a eles. Assim, o clomifeno se liga aos receptores de estrogênio nas células, bloqueando o acesso do estrogênio sanguíneo. No entanto, deve-se notar que o clomifeno opera com uma eficiência consideravelmente inferior à do tamoxifeno em relação à sua atividade antagonista estrogênica no tecido mamário.</p>
<p>A dosagem inicial média de clomifeno deve ser de aproximadamente 150 mg por dia, mantida por 1 a 2 semanas. Em seguida, deve ser reduzida para 100 mg por mais 1 a 2 semanas, com a dosagem final caindo para 25 a 50 mg por dia na última semana da TPC. As dosagens exatas são individuais e devem ser determinadas com base nos resultados de exames laboratoriais.</p>
<p><strong>AVISO:</strong> O momento correto para iniciar o uso do clomifeno depende do tipo e do ciclo de esteroides utilizados. Diferentes esteroides têm diferentes meias-vidas (indica o tempo que uma substância diminui no sangue), e a administração do clomifeno deve ser feita de acordo com isso. Se o seu ciclo terminar com esteroides de base de éster longo, a dose inicial de Clomos deverá começar aproximadamente duas semanas após a última injeção; se terminar com esteroides de base de éster curto, a TPC começará cerca de três dias após a última injeção. O uso de clomifeno quando os níveis de androgênios no sangue ainda estão elevados será ineficaz. É fundamental aguardar que os níveis de androgênios caiam antes de iniciar a terapia pós-ciclo. No entanto, se iniciado tarde demais, poderá haver perda muscular.</p>
<p>Não há considerações especiais para a administração do clomifeno. Pode ser administrado antes, durante ou após as refeições. Também pode ser consumido pela manhã ou à noite, antes de dormir. Não há necessidade de dividir a dosagem ao longo do dia, pois a meia-vida do clomifeno é de aproximadamente 5 dias, o que é suficientemente longo para manter níveis sanguíneos estáveis por um período de 24 horas (ou mais), sem necessidade de dividir comprimidos ou dosagens.</p>
</div>

    <h3 class="a">
'@
$content = $content -replace $oldDesc, $newDesc

# Properties table labels
$content = $content -replace '>Chemical name<', '>Nome químico<'
$content = $content -replace '>Formula<', '>Fórmula<'
$content = $content -replace '>Anabolic activity index<', '>Índice de atividade anabólica<'
$content = $content -replace '>Androgenic activity index<', '>Índice de atividade androgênica<'
$content = $content -replace '>Active half-life<', '>Meia-vida ativa<'
$content = $content -replace '>Classification<', '>Classificação<'
$content = $content -replace '>Dosage<', '>Dosagem<'
$content = $content -replace '>Acne<', '>Acne<'
$content = $content -replace '>Water retention<', '>Retenção de água<'
$content = $content -replace '>Hepatoxity<', '>Hepatotoxicidade<'
$content = $content -replace '>Hepatotoxicity<', '>Hepatotoxicidade<'
$content = $content -replace '>Aromatization<', '>Aromatização<'

# Recommendation heading
$content = $content -replace 'Post-cycle therapy \(PCT\)(?=\s*</span>)', 'Terapia Pós-Ciclo (TPC)'
$content = $content -replace 'We recommend to use in stack with this product the following items:', 'Recomendamos usar em combinação com este produto os seguintes itens:'

# Product tabs
$content = $content -replace '>Muscle Mass<', '>Massa Muscular<'
$content = $content -replace '>Burning<', '>Queima de Gordura<'
$content = $content -replace '>Recovery<', '>Recuperação<'

# Footer category headings
$content = $content -replace '>TESTOSTERONES<', '>TESTOSTERONAS<'
$content = $content -replace '>NANDROLONES<', '>NANDROLONAS<'
$content = $content -replace '>BOLDENONES<', '>BOLDENONAS<'
$content = $content -replace '>TRENBOLONES<', '>TRENBOLONAS<'
$content = $content -replace '>STANOZOLOL<', '>STANOZOLOL<'
$content = $content -replace '>MASTERONES<', '>MASTERONAS<'
$content = $content -replace '>MIXES SPECIAL LINE<', '>MIXES LINHA ESPECIAL<'
$content = $content -replace '>ORALS<', '>ORAIS<'
$content = $content -replace '>INJECTABLES<', '>INJETÁVEIS<'
$content = $content -replace '>POST-CYCLE THERAPY \(PCT\)<', '>TERAPIA PÓS-CICLO (TPC)<'
$content = $content -replace '>FAT LOSS<', '>PERDA DE GORDURA<'
$content = $content -replace 'Ampules', 'Ampolas'

# Footer copyright / misc
$content = $content -replace 'All rights reserved', 'Todos os direitos reservados'
$content = $content -replace 'Home', 'Início'

# Fix trailing corrupted chars at end of lines (replacement character)
$content = $content -replace '\xEF\xBF\xBD', ''

[System.IO.File]::WriteAllText($dst, $content, [System.Text.Encoding]::UTF8)
Write-Host "Done! Written to $dst"
