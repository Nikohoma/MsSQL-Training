-- CRUD 

use PracticeDB	

-- Procedure 1

Create Procedure InsertingProcedure
as
Begin 
INSERT INTO Department
                         (ID, Name)
VALUES         (556,'Administration'), (557,'Management')
End

InsertingProcedure

SELECT * FROM Department

-- Procedure 2
Create Procedure UpdateID
as
Begin

UPDATE       Department
SET                ID = 558
WHERE        (Name = 'Management')

End

UpdateID