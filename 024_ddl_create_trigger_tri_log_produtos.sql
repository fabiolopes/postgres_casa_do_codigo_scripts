create trigger tri_log_produtos
after insert or update or delete on produtos
	for each row execute
		procedure gera_log_produtos();