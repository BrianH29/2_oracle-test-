-- 1. ������ �븮�̸鼭 ASIA������ �ٹ��ϴ� ��������
--    ���, �����, ���޸�, �μ���, �ٹ�������, �޿��� ��ȸ�Ͻÿ�
SELECT EMP_ID ���, 
       EMP_NAME �����, 
       JOB_NAME ���޸�, 
       DEPT_TITLE �μ���, 
       LOCAL_NAME �ٹ�������, 
       SALARY �޿�
  FROM EMPLOYEE E,
       JOB J,
       DEPARTMENT D,
       LOCATION L
 WHERE E.JOB_CODE = J.JOB_CODE
   AND E.DEPT_CODE = D.DEPT_ID
   AND D.LOCATION_ID = L.LOCAL_CODE;
  
SELECT EMP_ID ���, 
       EMP_NAME �����, 
       JOB_NAME ���޸�, 
       DEPT_TITLE �μ���, 
       LOCAL_NAME �ٹ�������, 
       SALARY �޿�
  FROM EMPLOYEE E
  JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
  JOIN DEPARTMENT D ON(E.DEPT_CODE = D.DEPT_ID)
  JOIN LOCATION L ON(D.LOCATION_ID = L.LOCAL_CODE);


-- 2. 70�����̸鼭 �����̰�, ���� ������ ��������
--    �����, �ֹι�ȣ, �μ���, ���޸��� ��ȸ�Ͻÿ�
SELECT EMP_NAME �����,
       EMP_NO �ֹι�ȣ,
       DEPT_TITLE �μ���,
       JOB_NAME ���޸�
  FROM EMPLOYEE E, DEPARTMENT D, JOB J
 WHERE E.DEPT_CODE = D.DEPT_ID
   AND E.JOB_CODE = J.JOB_CODE
   AND SUBSTR(EMP_NO,1,2) BETWEEN 70 AND 80 
   AND SUBSTR(EMP_NO,8,1) = '2'
   AND EMP_NAME LIKE '��%';
   
SELECT EMP_NAME �����,
       EMP_NO �ֹι�ȣ,
       DEPT_TITLE �μ���,
       JOB_NAME ���޸�
  FROM EMPLOYEE E
  JOIN DEPARTMENT D ON(E.DEPT_CODE = D.DEPT_ID)
  JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
   AND SUBSTR(EMP_NO,1,2) BETWEEN 70 AND 80 
   AND SUBSTR(EMP_NO,8,1) = '2'
   AND SUBSTR(EMP_NAME,1,1) = '��';

-- 3. �̸��� '��'�ڰ� ����ִ� ��������
--    ���, �����, ���޸��� ��ȸ�Ͻÿ�
SELECT EMP_ID ���,
       EMP_NAME �����,
       JOB_NAME ���޸�
  FROM EMPLOYEE E, JOB J
 WHERE E.JOB_CODE = J.JOB_CODE
   AND EMP_NAME LIKE '%��%';


-- 4. �ؿܿ������� �ٹ��ϴ� ��������
--    �����, ���޸�, �μ��ڵ�, �μ����� ��ȸ�Ͻÿ�
SELECT EMP_NAME �����,
       JOB_NAME ���޸�,
       DEPT_ID �μ��ڵ�,
       DEPT_TITLE �μ���
  FROM EMPLOYEE E, JOB J, DEPARTMENT D
 WHERE E.JOB_CODE = J.JOB_CODE
   AND E.DEPT_CODE = D.DEPT_ID
   AND DEPT_TITLE LIKE '%�ؿ�%'
 ORDER BY 1;

SELECT EMP_NAME �����,
       JOB_NAME ���޸�,
       DEPT_ID �μ��ڵ�,
       DEPT_TITLE �μ���
  FROM EMPLOYEE E
  JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE)
  JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
   AND DEPT_TITLE LIKE '%�ؿ�%';
   
-- 5. ���ʽ��� �޴� ��������
--    �����, ���ʽ�, ����, �μ���, �ٹ��������� ��ȸ�Ͻÿ�
SELECT EMP_NAME �����,
       BONUS ���ʽ�,
       SALARY*12 ����,
       DEPT_TITLE �μ���,
       LOCAL_NAME �ٹ�������
  FROM EMPLOYEE E, DEPARTMENT D, LOCATION L
 WHERE E.DEPT_CODE = D.DEPT_ID
   AND D.LOCATION_ID = L.LOCAL_CODE
ORDER BY BONUS NULLS LAST; 

SELECT EMP_NAME �����,
       BONUS ���ʽ�,
       SALARY*12 ����,
       DEPT_TITLE �μ���,
       LOCAL_NAME �ٹ�������
  FROM EMPLOYEE E
  JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
  JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
  ORDER BY BONUS NULLS LAST;

-- 6. �μ��� �ִ� ��������
--    �����, ���޸�, �μ���, �ٹ��������� ��ȸ�Ͻÿ�
SELECT EMP_NAME �����,
       JOB_NAME ���޸�,
       DEPT_TITLE �μ���,
       LOCAL_NAME �ٹ�������
  FROM EMPLOYEE E, JOB J, DEPARTMENT D, LOCATION L
 WHERE E.JOB_CODE = J.JOB_CODE
   AND E.DEPT_CODE = D.DEPT_ID
   AND D.LOCATION_ID = L.LOCAL_CODE
   AND E.DEPT_CODE IS NOT NULL; 
   
SELECT EMP_NAME �����,        
       JOB_NAME ���޸�,
       DEPT_TITLE �μ���,
       LOCAL_NAME �ٹ�������
  FROM EMPLOYEE E
  JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE)
  JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
  JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
   AND E.DEPT_CODE IS NOT NULL;

-- 7. '�ѱ�'�� '�Ϻ�'�� �ٹ��ϴ� �������� 
--    �����, �μ���, �ٹ�������, �ٹ��������� ��ȸ�Ͻÿ�        
SELECT EMP_NAME �����,
       DEPT_TITLE �μ���,
       LOCAL_NAME �ٹ�������,
       NATIONAL_NAME ������
  FROM EMPLOYEE E, DEPARTMENT D, LOCATION L, NATIONAL N
 WHERE E.DEPT_CODE = D.DEPT_ID
   AND D.LOCATION_ID = L.LOCAL_CODE
   AND L.NATIONAL_CODE = N.NATIONAL_CODE
   AND N.NATIONAL_NAME IN ('�ѱ�','�Ϻ�'); 
   
SELECT EMP_NAME �����,
       DEPT_TITLE �μ���,
       LOCAL_NAME �ٹ�������,
       NATIONAL_NAME ������
  FROM EMPLOYEE E
  JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
  JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
  JOIN NATIONAL N ON (L.NATIONAL_CODE = N.NATIONAL_CODE)
   AND NATIONAL_NAME IN ('�ѱ�','�Ϻ�');

-- 8. ���ʽ��� ���� �ʴ� ������ �� �����ڵ尡 J4 �Ǵ� J7�� ��������
--    �����, ���޸�, �޿��� ��ȸ�Ͻÿ�
SELECT EMP_NAME �����,
       JOB_NAME ���޸�,
       SALARY �޿�
  FROM EMPLOYEE E, JOB J 
 WHERE E.JOB_CODE = J.JOB_CODE
   AND BONUS IS NULL 
   AND E.JOB_CODE IN ('J4','J7');
   
SELECT EMP_NAME �����,
       JOB_NAME ���޸�,
       SALARY �޿�
  FROM EMPLOYEE E
  JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE)
   AND BONUS IS NULL
   AND E.JOB_CODE IN ('J4','J7');

-- 9. ���, �����, ���޸�, �޿����, ������ ��ȸ�ϴµ�
--    �̶� ���п� �ش��ϴ� ����
--    �޿������ S1, S2�� ��� '���'
--    �޿������ S3, S4�� ��� '�߱�'
--    �޿������ S5, S6�� ��� '�ʱ�' ���� ��ȸ�ǰ� �Ͻÿ�.
SELECT EMP_NO ���,
       EMP_NAME �����,
       JOB_NAME ���޸�,
       SAL_LEVEL �޿����,
       DECODE(SAL_LEVEL,'S1','���','S2','���',
                        'S3','�߱�','S4','�߱�',
                        'S5','�ʱ�','S6','�ʱ�') �޿����
  FROM EMPLOYEE E, JOB J, SAL_GRADE S
 WHERE E.JOB_CODE = J.JOB_CODE
   AND SALARY BETWEEN MIN_SAL AND MAX_SAL; 
    

-- 10. �� �μ��� �� �޿����� ��ȸ�ϵ�
--     �̶�, �� �޿����� 1000���� �̻��� �μ���, �޿����� ��ȸ�Ͻÿ�
SELECT DEPT_TITLE �μ���, 
       SUM(SALARY)�޿���
  FROM EMPLOYEE E, DEPARTMENT D
 WHERE E.DEPT_CODE = D.DEPT_ID
GROUP BY DEPT_TITLE
HAVING SUM(SALARY) >10000000
 ORDER BY 1;

SELECT DEPT_TITLE �μ���, 
       SUM(SALARY)�޿���
  FROM EMPLOYEE E
  JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
 GROUP BY DEPT_TITLE
HAVING SUM(SALARY) >10000000
 ORDER BY 1; 
-- 11. �� �μ��� ��ձ޿��� ��ȸ�Ͽ� �μ���, ��ձ޿� (����ó��)�� ��ȸ�Ͻÿ�.
--      ��, �μ���ġ�� �ȵ� ������� ��յ� ���� �����Բ� �Ͻÿ�.
SELECT DEPT_TITLE �μ���,
       FLOOR(AVG(SALARY)) ��ձ޿�
  FROM EMPLOYEE E, DEPARTMENT D
 WHERE E.DEPT_CODE = D.DEPT_ID(+)
 GROUP BY DEPT_TITLE
 ORDER BY DEPT_TITLE NULLS LAST;
 
 SELECT DEPT_TITLE �μ���,
       FLOOR(AVG(SALARY)) ��ձ޿�
  FROM EMPLOYEE E
  LEFT JOIN DEPARTMENT D ON(E.DEPT_CODE = D.DEPT_ID)
 GROUP BY DEPT_TITLE
 ORDER BY 1 NULLS LAST;