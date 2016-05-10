Name:    nx-scaler
Version: 0.0.1
Release: 0
License: Apache 2.0
Summary: Nexell scaler
Group: Development/Libraries
Source:  %{name}-%{version}.tar.gz

BuildRequires:  pkgconfig(glib-2.0)
BuildRequires:  gst-plugins-renderer

Requires(post): /sbin/ldconfig
Requires(postun): /sbin/ldconfig

%description
Nexell scaler

%package devel
Summary: Nexell scaler
Group: Development/Libraries
License: Apache 2.0
Requires: %{name} = %{version}-%{release}

%description devel
Nexell scaler (devel)

%prep
%setup -q

%build
make

%postun -p /sbin/ldconfig

%install
rm -rf %{buildroot}

mkdir -p %{buildroot}/usr/include
cp %{_builddir}/%{name}-%{version}/*.h  %{buildroot}/usr/include

mkdir -p %{buildroot}/usr/lib
cp %{_builddir}/%{name}-%{version}/*.so  %{buildroot}/usr/lib

%files
%attr (0644, root, root) %{_libdir}/*

%files devel
%attr (0644, root, root) %{_includedir}/*
