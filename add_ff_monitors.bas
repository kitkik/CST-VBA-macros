'#Language "WWB-COM"

Option Explicit

Sub Main
	Dim dFreq As Double

    Dim fNames(3) As String
    For dFreq = 60 To 60.002 STEP 0.001
    	dFreq = Round(dFreq,3)
      With Monitor
     	.Reset
     	.Name ("farfield (f="+CStr(dFreq)+")")
     	.Dimension ("Volume")
     	.Domain ("Frequency")
     	.FieldType ("Farfield")
     	.Frequency (dFreq)
     	.Create
      End With		
    Next dFreq
End Sub
