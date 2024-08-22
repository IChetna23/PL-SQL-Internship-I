# pan no check - regex expressions

create or replace PROCEDURE validate_pan_number(p_pan IN VARCHAR2) IS
   v_is_valid BOOLEAN;
BEGIN
   v_is_valid := REGEXP_LIKE(p_pan, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$');

   IF v_is_valid THEN
      DBMS_OUTPUT.PUT_LINE('The email is valid.');
   ELSE
      DBMS_OUTPUT.PUT_LINE('The email is invalid.');
   END IF;
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;