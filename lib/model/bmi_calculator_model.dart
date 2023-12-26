class BmiCalculator {
  final double weight;
  final double height;

//<editor-fold desc="Data Methods">
  const BmiCalculator({
    required this.weight,
    required this.height,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BmiCalculator &&
          runtimeType == other.runtimeType &&
          weight == other.weight &&
          height == other.height);

  @override
  int get hashCode => weight.hashCode ^ height.hashCode;

  @override
  String toString() {
    return 'BmiCalculator{' + ' weight: $weight,' + ' height: $height,' + '}';
  }

  BmiCalculator copyWith({
    double? weight,
    double? height,
  }) {
    return BmiCalculator(
      weight: weight ?? this.weight,
      height: height ?? this.height,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weight': this.weight,
      'height': this.height,
    };
  }

  factory BmiCalculator.fromJson(Map<String, dynamic> json) {
    return BmiCalculator(
      weight: json['weight'] as double,
      height: json['height'] as double,
    );
  }

//</editor-fold>
}
