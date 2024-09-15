--View total_capturas_cacador, mostra o total de criaturas capturadas por cada caçador.
--Seria útil numa situação onde, por exemplo, o ministério da magia quisesse investigar 
--mortes de criaturas em risco de extinção e quisessem procurar os caçadores mais ativos.

CREATE OR REPLACE VIEW total_capturas_cacador AS
SELECT 
    MAGIZOOLOGISTA.nome AS "nome do cacador",
    CACADOR_DE_RECOMPENSA.cacador_cum AS cum,
    SUM(CAPTURA.quantidade_capturada) AS "total de criaturas capturadas"
FROM 
    CACADOR_DE_RECOMPENSA
JOIN 
    MAGIZOOLOGISTA ON CACADOR_DE_RECOMPENSA.cacador_cum = MAGIZOOLOGISTA.cum
JOIN 
    CAPTURA ON CACADOR_DE_RECOMPENSA.cacador_cum = CAPTURA.cacador_cum
GROUP BY 
    MAGIZOOLOGISTA.nome, CACADOR_DE_RECOMPENSA.cacador_cum;

--Utilizando a view junto a uma consulta para nos mostrar do caçador com mais criaturas capturadas
--para o com menos criaturas. 

SELECT * FROM total_capturas_cacador
ORDER BY "total de criaturas capturadas" DESC;