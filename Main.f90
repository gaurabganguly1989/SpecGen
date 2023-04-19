Program Main
    use Declaration
    implicit none
  
    integer               ::  m               ! for reading file in commandline argument
  
    character(len=120)    ::  dat, sigma      ! name of the data file
    integer               ::  n, i, j         ! n=number of data points, i,j=dummy indices
    real(8)               ::  x, e_delta, broaden, padding
    real(8), external     ::  Gauss
    real(8)               ::  imp_val

 
    ! Read the file in the command line argument
    m = iargc()
    if ( m /= 2 ) then
      write(6,'(a)')  'Script Usage: ./spec-gen [trans.stk] [sigma]'
      call exit(8)
    endif

    write(6,'(a)')  'Caution: file trans.stk shoild not have trailing spaces!'
    ! Read the trans.stk file [Energy vs. Osc. str.] & sigma broadening value
    call getarg(1,dat)
    call getarg(2,sigma)
    
    ! convert to float
    Read(sigma,*) broaden

    open(unit=10, file=dat, status='unknown')
    n = 0
    do
      read(10,*,end=2)
      n = n+1
    enddo 
2   close(10)

    ! Store the data into an array
    allocate(E(n),f(n))
    open(unit=10, file=dat, status='unknown') 
    call GetTrans(n,E,f)
    close(10)

    Emin    = MinVal(E, dim=1)     
    Emax    = MaxVal(E, dim=1)     
    padding = factor*broaden
    e_delta = ((Emax+padding)-(Emin-padding))/npoints

    do i=0,npoints
      x = (Emin-padding)+(i*e_delta)
      imp_val = 0.d0
      do j=1,n
        imp_val = imp_val + f(j)*Gauss(broaden,x,E(j))/3.48d-2 
      enddo
      write(6,'(f8.3,e12.4)') x, imp_val
    enddo 

    deallocate(E,f)

End Program Main



