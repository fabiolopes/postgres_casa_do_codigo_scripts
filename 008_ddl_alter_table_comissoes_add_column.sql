--alterando comissoes adicionando nova coluna de data
alter table comissoes add column data_pagamento int;

--coluna está com o tipo diferente. temos 2 escolhas
-- dropar a coluna (alter table comissoes drop column data_pagamento_int)
--ou, como abaixo alter tipo, com a sequência abaixo
alter table comissoes add column data_pagamento_time timestamp;
alter table comissoes alter column data_pagamento type timestamp USING data_pagamento_time;
alter table comissoes drop column data_pagamento_time;