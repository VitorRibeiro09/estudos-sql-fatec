
/************************************************************
 * TRABALHO DE BANCO DE DADOS - BIBLIOTECA
 * Alunos: Vitor Samuel e Gabriel Valente
 ************************************************************/

//1
SELECT p.pes_nome
FROM Pessoa p
JOIN Emprestimo e ON p.pes_cod = e.pes_cod
WHERE e.emp_cod = 1;

//2
SELECT edi_descricao
FROM Editora
ORDER BY edi_descricao;

//3
SELECT liv_titulo
FROM Livro
WHERE liv_titulo LIKE 'A%';

//4
SELECT liv_titulo
FROM Livro
WHERE liv_titulo LIKE 'A%'
    AND anopublicacao > '2013';
   
   
//5
SELECT COUNT(*)
FROM Telefone
WHERE tel_ddd = 12;


//6
SELECT pes_nro_matricula, COUNT(*) AS quantidade
FROM Aluno
GROUP BY pes_nro_matricula;


//7
SELECT 
    e.edi_cod, 
    e.edi_descricao, 
    l.liv_cod
FROM 
    editora e
INNER JOIN 
    livro l ON e.edi_cod = l.edi_cod;
    
//8
SELECT 
    ex.exe_cod, 
    ex.exe_descricao
FROM 
    exemplar ex
INNER JOIN 
    item_emprestimo it ON ex.exe_cod = it.exe_cod
INNER JOIN 
    emprestimo emp ON it.emp_cod = emp.emp_cod
WHERE 
    emp.emp_data_emprestimo = TO_DATE('20/05/2023', 'DD/MM/YYYY');
    
//9
SELECT
    liv_cod,
    COUNT(*) AS total_exemplares
FROM
    exemplar
GROUP BY
    liv_cod
HAVING
    COUNT(*) > 0;
    
//10
SELECT 
    p.pes_nome, 
    pr.titulacao, 
    t.tel_numero
FROM 
    Pessoa p
INNER JOIN 
    Professor pr ON p.pes_cod = pr.pes_cod
LEFT JOIN 
    Telefone t ON p.pes_cod = t.pes_cod;
    
//11
SELECT 
    liv_titulo, 
    anopublicacao
FROM 
    Livro
WHERE 
    anopublicacao = (SELECT MIN(anopublicacao) FROM Livro);
    
//12 
SELECT 
    p.pes_nome, 
    COUNT(e.emp_cod) AS total_emprestimos
FROM 
    Pessoa p
INNER JOIN 
    Emprestimo e ON p.pes_cod = e.pes_cod
GROUP BY 
    p.pes_nome
ORDER BY 
    total_emprestimos DESC
FETCH FIRST 1 ROW ONLY;

//13
SELECT 
    l.liv_titulo, 
    COUNT(e.exe_cod) AS quantidade_exemplares
FROM 
    Livro l
LEFT JOIN 
    Exemplar e ON l.liv_cod = e.liv_cod
GROUP BY 
    l.liv_titulo, 
    l.liv_cod;
    
//14
SELECT 
    liv_titulo, 
    anopublicacao
FROM 
    Livro
WHERE 
    liv_titulo LIKE 'A%'
    AND anopublicacao > '2011';
    
//15
SELECT DISTINCT
    l.liv_titulo
FROM 
    Emprestimo e
INNER JOIN 
    ITEM_EMPRESTIMO it ON e.emp_cod = it.emp_cod
INNER JOIN 
    Exemplar ex ON it.exe_cod = ex.exe_cod
INNER JOIN 
    Livro l ON ex.liv_cod = l.liv_cod
WHERE 
    e.pes_cod = 1;
    
//16 - criando as 7 consultas:

SELECT p.pes_nome, a.pes_nro_matricula
FROM Pessoa p
INNER JOIN Aluno a ON p.pes_cod = a.pes_cod;

SELECT e.edi_descricao, COUNT(l.liv_cod) AS total_livros
FROM Editora e
LEFT JOIN Livro l ON e.edi_cod = l.edi_cod
GROUP BY e.edi_descricao;

SELECT p.pes_nome, t.tel_numero
FROM Pessoa p
INNER JOIN Telefone t ON p.pes_cod = t.pes_cod
WHERE UPPER(t.tip_descricao) = 'CELULAR';

SELECT l.liv_titulo, d.data_dev
FROM Devolucao d
INNER JOIN Exemplar ex ON d.exe_cod = ex.exe_cod
INNER JOIN Livro l ON ex.liv_cod = l.liv_cod;

SELECT DISTINCT p.pes_nome
FROM Pessoa p
INNER JOIN Emprestimo e ON p.pes_cod = e.pes_cod
WHERE e.emp_data_emprestimo BETWEEN TO_DATE('01/01/2024', 'DD/MM/YYYY') 
                            AND TO_DATE('31/12/2024', 'DD/MM/YYYY');
                            
SELECT ex.exe_descricao, l.liv_titulo
FROM Exemplar ex
INNER JOIN Livro l ON ex.liv_cod = l.liv_cod
WHERE ex.ex_status = 1;

SELECT p.pes_nome
FROM Pessoa p, Telefone t
WHERE p.pes_cod = t.pes_cod(+)
AND t.tel_cod IS NULL;