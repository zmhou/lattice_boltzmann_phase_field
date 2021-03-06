//*****************************************************************************//
// Lattice Boltzmann related variables
//*****************************************************************************//
double *f, *f_str;
double feq[Q];
double *u, *v, *rho;

//*****************************************************************************//
// Phi Solver Related Variables
//*****************************************************************************//
double *phi_old, *phi_new, *mu_new, *mu_old, *lap_phi, *lap_mu, *conc, *dphi_now, *dphi_next;
//****************************************************************************//
int start, end;
