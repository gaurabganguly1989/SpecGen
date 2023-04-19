Module Declaration

    implicit none
  
    real(8), parameter      ::  pi=4.d0*atan(1.d0)  ! value of pi
    real(8), allocatable    ::  E(:), f(:)          ! Energy & osc. str.
    real(8)                 ::  Emin, Emax          ! Max/Min energy in eV
    real(8), parameter      ::  factor=5.d0         ! factor to be multiplied with sigma to get padding
    integer, parameter      ::  npoints=2000        ! number of points in the Gaussian broadened spectrum

End Module Declaration



