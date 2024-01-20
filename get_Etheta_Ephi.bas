'#Language "WWB-COM"

Option Explicit

Sub Main
	Dim dTheta As Double, dPhi As Double, dValue As Double, dFreq As Double, n As Integer,m As Long, theta_am_list() As Double, theta_ph_list() As Double, phi_am_list() As Double, phi_ph_list() As Double, position_theta() As Double, position_phi() As Double

	n=0
    Dim fNames As String
    For dFreq = 0.5 To 1 STEP 0.05
    	dFreq = Round(dFreq,2)
		fNames="Farfields\farfield (f="+CStr(dFreq)+") [1]"
		Open "D:\waveguide 0.5-1\Theta_HW_"+CStr(dFreq)+".txt" For Output As #1
		Open "D:\waveguide 0.5-1\Phi_HW_"+CStr(dFreq)+".txt" For Output As #2
		FarfieldPlot.SetPlotMode "directivity"
		SelectTreeItem(fNames)
		FarfieldPlot.Plot
		For dPhi = 0 To 359 STEP 5
		For dTheta = 0 To 180 STEP 5
		FarfieldPlot.AddListEvaluationPoint(dTheta, dPhi, 0, "spherical", "frequency", dFreq)
		Next dTheta
		Next dPhi
		FarfieldPlot.CalculateList("")
		theta_am_list = FarfieldPlot.GetList("Spherical linear theta abs")
        theta_ph_list = FarfieldPlot.GetList("Spherical linear theta phase")
        phi_am_list = FarfieldPlot.GetList("Spherical linear phi abs")
        phi_ph_list = FarfieldPlot.GetList("Spherical linear phi phase")
        position_theta = FarfieldPlot.GetList("Point_T")
        position_phi   = FarfieldPlot.GetList("Point_P")
        m=0
        For dPhi = 0 To 359 STEP 5
		For dTheta = 0 To 180 STEP 5
            Print #1, CStr(dTheta) + " " +  CStr(dPhi) + " " + CStr(theta_am_list(m)) + " " + CStr(theta_ph_list(m))
            Print #2, CStr(dTheta) + " " +  CStr(dPhi) + " " + CStr(phi_am_list(m)) + " " + CStr(phi_ph_list(m))
            m=m+1
		Next dTheta
		Next dPhi
        Close #1
		Close #2
		n=n+1
    Next dFreq
End Sub
