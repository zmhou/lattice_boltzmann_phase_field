%================================Constants==============================
V       =  3.3e-3;
c_eq    =  1.0;
k       =  0.2;
D       =  1.0;
Gamma   =  1;
G       =  -1*c_eq*(1-k)*V/(D);
c_str   =  c_eq*(k-1);
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
omega_init  = 0;
omega_final = 0.06;
omega_step  = (omega_final - omega_init)/1000;
indx        = 1000;
ampl_fac    = zeros(indx);
omega       = zeros(indx);
omega(1)    = omega_init;
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
for i = 2:indx
  omega(i)      =  omega(i-1) + omega_step;
  omega_sqr     =  omega(i)*omega(i);
  first_term    =  V/(2.0*D);
  first_term_sq =  first_term*first_term;
  k_omega       =  first_term + sqrt(first_term_sq + (omega(i)*omega(i)));
  omega_tilda   =  k_omega - (V*(1.0-k)/D);
  % b             =  Gamma*omega(i)*omega(i)/(mu_eq*(1-k));
  % b             = -1.0*(Gamma*omega_sqr)/m;
  b             = (Gamma*omega_sqr)/c_str;
  ampl_fac(i)   =  -D*b/(c_str)*(G/c_eq + k_omega) + G*D*k_omega/c_str*(1-V/(k_omega*D));
%    ampl_fac(i)   =  omega_tilda*V*(-(b/G) + (1.0/omega_tilda)*(k_omega-(V/D)));
end
figure
f = load('delta.dat');
axis([0 0.07 -inf inf])
xlabel('Frequency');
ylabel('Amplification_Factor');
%disp(omega(indx));
plot(omega, ampl_fac,f(:,1),f(:,2),'--ro')
% plot(omega, ampl_fac)
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
