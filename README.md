<h1>Scripts para trabalho</h1>
<h2>Zabbix 5</h2>
<p>Está metodo de istalação funciona em:<br/>
 SO: Ubuntu 18.04<br/>
 Base de Dadoos: MySQL<br/>
 Servidor Web: Apache
</p>
<br/><br/>
<h1>Backupt automatização<br/></h1>
<h3>Edite o arquivo digite: crontab -e </h3>
<h6>Minuto (0 a 59) | Hora (0 a 23) | Dia (1 a 31) | Mês (1 a 12)| Dia da semana (0 a 7) | Comando (comando a ser executado).</br></h6>
<h4>25 6 * * * root /usr/local/bin/script-backup</h4><br/>
<p>Ou seja, para cada campo será digitado um valor correspondente às regras acima. Detalhe: o dia da semana oferece oito possibilidades, sendo que os valores 0 e 7 significam domingo.<br/>

<h2>CARACTERES ESPECIAIS E SUAS FUNÇÕES</h2>
Em meio a uma instrução do Crontab é comum que o usuário se depare com alguns caracteres / símbolos que têm funções específicas, como asterisco (*), vírgula (,), hífen (-) e barra (/). Vejamos o que eles significam.<br/>

<h2>ASTERISCO</h2>
O asterisco serve para especificar que todos os valores do campo serão validados. Vamos supor que um determinado comando tenha de ser executado diariamente durante o mês; para configurar o Crontab, basta inserir o asterisco no campo “Mês”.<br/>

<h2>HÍFEN</h2>
O sinal de hífen é usado para especificar um intervalo. Por exemplo, se o comando deve ser executado somente em dias úteis (segunda a sexta), o campo “Dia” deve ser preenchido da seguinte maneira: 1-5.<br/>

<h2>VÍRGULA</h2>
As vírgulas têm a função de listar uma sequência de valores. É uma opção ideal para agendar momentos esporádicos, como uma tarefa a ser executada nos dias 4, 15 e 19 do mês. No caso, o preenchimento do campo “Dia” ficaria: 4, 15, 19.<br/>

<h2>BARRA</h2>
A barra frontal (forward slash, do inglês), por sua vez, especifica a etapa dos valores. Supondo que seja inserido o valor 0-55/5 (ou */5), a tarefa será executada a cada cinco minutos.<br/>

<h2>HASH</h2>
Assim como no ambiente de programação, o símbolo hash (#) é usado para adicionar comentários em uma instrução. Deste modo o conteúdo não será processado pela ferramenta.

Fácil de entender, não é mesmo? Por meio dessa sintaxe é possível criar diversos tipos de agendamento pelo Cron, conforme os exemplos que veremos a seguir.<br/>

</p>

