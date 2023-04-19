Real(8) Function Gauss(sigma,x,x0) Result(g)
    use Declaration
    implicit none

    real(8), intent(in), optional     ::  sigma  
    real(8), intent(in)               ::  x, x0
    real(8)                           ::  s

!=============================================================================================
! g = 1/(sigma*sqrt(2*pi)) * exp(-1/2((x-x0)/2*sigma^2))
! 
! Full width at half maxima (FWHM) = 2*sqrt(2*log2)*sigma
! Half width at half maxima (HWHM) = (1/2)*FWHM = sqrt(2*log2)*sigma
! 
! Default value of HWHM in GaussView software = 0.333 eV
! We, therefore, choose the default value of sigma = 0.333/sqrt(2*log2) eV = 0.55315614617
!=============================================================================================

    if (present(sigma)) then
        s = sigma
    else
        s = 0.55315614617d0
    end if

    g = 1.d0/(s*sqrt(2.d0*pi)) * exp(-(x-x0)**2/(2.d0*s**2)) 

End Function Gauss
