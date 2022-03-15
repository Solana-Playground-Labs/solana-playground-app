part of 'packages_cubit.dart';

class PackagesState extends Equatable {
  final List<Package> packages;

  const PackagesState({this.packages = const []});

  @override
  List<Object> get props => [packages];

  PackagesState copyWith({
    List<Package>? packages,
  }) {
    return PackagesState(
      packages: packages ?? this.packages,
    );
  }
}
