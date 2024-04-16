
-- ====================| 2024.04.16 AM |=========================

-- 		조인(JOIN)은 데이터베이스의 테이블 간의 결합을 의미한다.
-- 		여러 개의 테이블에 자원들이 흩어져있는 상태의 데이터를 
-- 		마치 하나의 테이블에서 결과를 내고싶을 때 JOIN을 사용한다.


-- 		예를 들어 원하는 결과가 다음과 같다면
-- 		 사번,이름,직종,입사일, 부서코드,부서명
-- 		 |---- emp ---- | |-- dept --|
-- 		이렇게 하나의 테이블에 있는 것처럼 결과를 얻기 위해
-- 		여러 개의 테이블 간 기본키와 외래키의 연결을 이용하여
-- 		JOIN을 사용할 때 가능하다.

SELECT empno, ename, job, hiredate, d.deptno, dname
FROM emp e INNER JOIN dept d -- 별칭 부여 필수
ON e.deptno = d.deptno
;

-- 조인의 종류
-- 	- INNER JOIN: 교집합
SELECT *
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno
;

-- 예) 각 부서별 도시명을 출력하라
SELECT d.deptno, d.dname, d.loc_code, l.city
FROM dept d INNER JOIN locations l
ON d.loc_code = l.loc_code
;

-- 위는 조인된 테이블들끼리 참조되는 동일한 자원들만 보여준다.
-- 그래서 사번이 7942인 JACK은 결과로 포함시키지 않는다.
-- 때에 따라 JACK같은 자원들도 결과로 포함시키고 싶을 때가 있는데
-- 이때, 사용하는 것이 OUTER JOIN이다.


-- LEFT, RIGHT JOIN : OUTER JOIN
-- 	LEFT JOIN은 왼쪽 테이블의 자원들을 "연결성을 고려하지않고" 모두 출력하며
-- 	오른쪽 테이블의 자원들은 연결되어 있는 자원들만 출력한다.
SELECT e.empno, e.ename, e.job, e.hiredate, e.deptno, d.dname
FROM emp e LEFT OUTER JOIN dept d -- 별칭 부여 필수
ON e.deptno = d.deptno
;

-- 	RIGHT JOIN은 오른쪽 테이블의 자원들을 "연결성을 고려하지않고" 모두 출력하며
-- 	왼쪽 테이블의 자원들은 연결되어 있는 자원들만 출력한다.

-- 현재 부서는 존재하지만 구성원이 없는 부서를 알아내기
SELECT e.empno, e.ename, e.job, e.hiredate, d.deptno, d.dname
FROM emp e RIGHT OUTER JOIN dept d -- 별칭 부여 필수
ON e.deptno = d.deptno
;

SELECT d.deptno, d.dname, COUNT(e.empno)
FROM emp e RIGHT OUTER JOIN dept d -- 별칭 부여 필수
ON e.deptno = d.deptno
GROUP BY 1,2
;

-- 문제) emp테이블에서 직종이 'ANALYST'인 사원들의 정보를
-- 		사번,이름,직종,급여,부서명,도시코드 순으로 출력하라

SELECT e.empno, e.ename, e.job, e.sal, d.dname, d.loc_code
FROM (emp e INNER JOIN dept d ON e.deptno = d.deptno)
WHERE e.job = 'ANALYST'
;

SELECT e.empno, e.ename, e.job, e.sal, d.dname, d.loc_code
FROM ((SELECT * FROM emp WHERE job = 'ANALYST') as e INNER JOIN dept d ON e.deptno = d.deptno)
;

-- 문제) 위의 내용에서 도시명을 하나 더 추가해서 출력하려 한다
-- 		사번,이름,직종,급여,부서명,도시코드 순으로 출력하라
SELECT e.empno, e.ename, e.job, e.sal, d.dname, d.loc_code, l.city
FROM (((
		SELECT * FROM emp WHERE job = 'ANALYST' ) as e
		LEFT OUTER JOIN dept d ON e.deptno = d.deptno)
        LEFT OUTER JOIN locations l ON d.loc_code = l.loc_code)
;

-- 또는
SELECT e.empno, e.ename, e.job, e.sal, d.deptno, d.dname, l.city
FROM emp e, dept d, locations l
WHERE e.deptno = d.deptno
  AND d.loc_code = l.loc_code
  AND e.job = 'ANALYST'


-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 